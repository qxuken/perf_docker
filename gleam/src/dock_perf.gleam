import gleam/http/elli
import gleam/http/response.{type Response}
import gleam/http/request.{type Request}
import gleam/bytes_builder.{type BytesBuilder}

pub fn my_service(_request: Request(t)) -> Response(BytesBuilder) {
  let body = bytes_builder.from_string("Hello, world!")

  response.new(200)
  |> response.prepend_header("Made-With", "Gleam")
  |> response.prepend_header("Keep-Alive", "timeout=5")
  |> response.prepend_header("Content-Type", "text/plain; charset=utf-8")
  |> response.set_body(body)
}

pub fn main() {
  elli.become(my_service, on_port: 3000)
}
