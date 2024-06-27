const http = require("node:http");

const server = http.createServer((_req, res) => {
  res.setHeader("made-with", "node");
  res.end("Hello, world!");
});

server.listen(3000);

// Running 5s test @ http://localhost:3000
//   80 goroutine(s) running concurrently
// 450230 requests in 4.980206627s, 58.39MB read
// Requests/sec:		90403.88
// Transfer/sec:		11.73MB
// Avg Req Time:		884.917µs
// Fastest Request:	25.042µs
// Slowest Request:	45.818333ms
// Number of Errors:	0
//
// Docker
// Running 5s test @ http://localhost:3013
//   80 goroutine(s) running concurrently
// 265628 requests in 4.976459224s, 34.45MB read
// Requests/sec:		53376.91
// Transfer/sec:		6.92MB
// Avg Req Time:		1.498775ms
// Fastest Request:	117.25µs
// Slowest Request:	136.086166ms
// Number of Errors:	0
// idle: cpu 0.32, ram 10mb, load: cpu 92.25 ram 40mb
