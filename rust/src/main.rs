use std::convert::Infallible;
use std::net::SocketAddr;

use http_body_util::Full;
use hyper::body::Bytes;
use hyper::server::conn::http1;
use hyper::service::service_fn;
use hyper::{Request, Response};
use hyper_util::rt::TokioIo;
use tokio::net::TcpListener;

async fn hello(_: Request<hyper::body::Incoming>) -> Result<Response<Full<Bytes>>, Infallible> {
    Ok(Response::builder()
        .status(200)
        .header("made-with", "Rust")
        .body(Full::new(Bytes::from("Hello, word!")))
        .unwrap())
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
    let addr = SocketAddr::from(([0, 0, 0, 0], 3000));

    // We create a TcpListener and bind it to 127.0.0.1:3000
    let listener = TcpListener::bind(addr).await?;

    // We start a loop to continuously accept incoming connections
    loop {
        let (stream, _) = listener.accept().await?;

        // Use an adapter to access something implementing `tokio::io` traits as if they implement
        // `hyper::rt` IO traits.
        let io = TokioIo::new(stream);

        // Spawn a tokio task to serve multiple connections concurrently
        tokio::task::spawn(async move {
            // Finally, we bind the incoming connection to our `hello` service
            if let Err(err) = http1::Builder::new()
                // `service_fn` converts our function in a `Service`
                .serve_connection(io, service_fn(hello))
                .await
            {
                eprintln!("Error serving connection: {:?}", err);
            }
        });
    }
}

//Running 5s test @ http://localhost:3000
//   80 goroutine(s) running concurrently
// 716946 requests in 4.733998805s, 60.17MB read
// Requests/sec:		151446.17
// Transfer/sec:		12.71MB
// Avg Req Time:		528.24µs
// Fastest Request:	19.625µs
// Slowest Request:	25.004417ms
// Number of Errors:	0
//
// Docker
// Running 5s test @ http://localhost:3010
//   80 goroutine(s) running concurrently
// 315240 requests in 4.957695022s, 26.46MB read
// Requests/sec:		63586.00
// Transfer/sec:		5.34MB
// Avg Req Time:		1.258138ms
// Fastest Request:	71.5µs
// Slowest Request:	39.440041ms
// Number of Errors:	0
// idle: cpu 0, ram 1.5mb, load: cpu 75 ram 4mb
