exports.getRootView = () => `
    <html>
      <head><title>mywebapp API</title></head>
      <body>
        <h1>mywebapp endpoints</h1>
        <ul>
          <li>GET /health/alive</li>
          <li>GET /health/ready</li>
          <li>GET /notes (or /tasks /items depending on variant)</li>
          <li>POST /notes</li>
          <li>GET /notes/:id</li>
        </ul>
      </body>
    </html>
  `;
