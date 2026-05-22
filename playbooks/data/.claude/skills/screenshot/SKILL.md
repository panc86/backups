---
description: Launch headless Chrome, navigate to a URL, and capture a screenshot. Usage - /screenshot [url] (default http://localhost:8080)
allowed-tools: Bash, Read
---

Visual verification tool. Launches headless Chrome (if not already running), navigates to a URL, and captures a screenshot for visual inspection.

**URL:** Use the argument passed to this command. If no argument was provided, default to `http://localhost:8080`.

## Steps

1. **Check if Chrome is already running** by checking:
   ```
   curl -s http://localhost:9222/json/version
   ```
   If it responds, skip to step 3.

2. **Launch Chrome** in the background:
   ```
   google-chrome --headless --disable-gpu --no-sandbox --remote-debugging-port=9222 &
   ```
   Wait briefly, then verify with the curl check above. If it fails, report the error and suggest `which google-chrome` to verify installation.

3. **Navigate and screenshot** using Node.js. Run this script, replacing `TARGET_URL` with the resolved URL from above:
   ```js
   node -e "
   const WebSocket = require('ws');
   const fs = require('fs');
   const cp = require('child_process');

   const TARGET_URL = 'TARGET_URL';
   const targets = JSON.parse(cp.execSync('curl -s http://localhost:9222/json').toString());
   let pageTarget = targets.find(t => t.type === 'page');

   async function run(wsUrl) {
     const ws = new WebSocket(wsUrl);
     let id = 0;
     const send = (method, params = {}) => {
       const msgId = ++id;
       return new Promise(resolve => {
         const handler = data => {
           const msg = JSON.parse(data);
           if (msg.id === msgId) { ws.removeListener('message', handler); resolve(msg); }
         };
         ws.on('message', handler);
         ws.send(JSON.stringify({ id: msgId, method, params }));
       });
     };
     ws.on('open', async () => {
       await send('Page.navigate', { url: TARGET_URL });
       await new Promise(r => setTimeout(r, 3000));
       await send('Emulation.setDeviceMetricsOverride', { width: 1280, height: 800, deviceScaleFactor: 1, mobile: false });
       const shot = await send('Page.captureScreenshot', { format: 'png' });
       fs.writeFileSync('/tmp/screenshot.png', Buffer.from(shot.result.data, 'base64'));
       console.log('Screenshot saved to /tmp/screenshot.png');
       ws.close();
     });
   }

   if (pageTarget) {
     run(pageTarget.webSocketDebuggerUrl);
   } else {
     const version = JSON.parse(cp.execSync('curl -s http://localhost:9222/json/version').toString());
     const bws = new WebSocket(version.webSocketDebuggerUrl);
     bws.on('open', () => {
       bws.send(JSON.stringify({ id: 1, method: 'Target.createTarget', params: { url: TARGET_URL } }));
       bws.on('message', () => {
         bws.close();
         setTimeout(() => {
           const t2 = JSON.parse(cp.execSync('curl -s http://localhost:9222/json').toString());
           const pt = t2.find(t => t.type === 'page');
           if (pt) run(pt.webSocketDebuggerUrl);
         }, 1000);
       });
     });
   }
   "
   ```

4. **Display the screenshot** using the Read tool on `/tmp/screenshot.png`.

5. **Report** what you see in the screenshot to the user. Describe the visible UI state briefly.

## Notes
- This environment is Ubuntu 24 inside a Docker container with GPU support. Chrome was installed from the official .deb package.
- WebGL/CesiumJS 3D globe will not render in headless Chrome — this is expected. UI controls and layout are still fully visible.
- If the user asks you to verify a change, take the screenshot AFTER the webpack dev server has had time to hot-reload (the 3-second wait in the script handles this).
