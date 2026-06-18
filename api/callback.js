export default async function handler(req, res) {
  const { code } = req.query;

  const response = await fetch('https://github.com/login/oauth/access_token', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify({
      client_id: process.env.GITHUB_CLIENT_ID,
      client_secret: process.env.GITHUB_CLIENT_SECRET,
      code
    })
  });

  const data = await response.json();
  const token = data.access_token;

  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <html>
    <body>
    <script>
      (function() {
        var token = "${token}";
        var message = 'authorization:github:success:' + JSON.stringify({ token: token });
        function receiveMessage(e) {
          window.opener.postMessage(message, e.origin);
        }
        window.addEventListener("message", receiveMessage, false);
        window.opener.postMessage("authorizing:github", "*");
      })();
    <\/script>
    </body>
    </html>
  `);
}