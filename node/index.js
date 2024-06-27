const http = require("node:http");

const server = http.createServer((_req, res) => {
  res.setHeader("Made-With", "Node");
  res.setHeader("Content-Type", "text/plain; charset=utf-8");
  res.end("Hello, world!");
});

server.listen(3000);
