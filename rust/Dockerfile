FROM rust:1.79-alpine as backend-builder

RUN apk update
RUN apk upgrade
RUN apk add --no-cache musl-dev

WORKDIR /app
COPY . .

RUN cargo build --release --locked

# ---

FROM alpine:latest

ENV RUST_LOG=info

COPY --from=backend-builder /app/target/release/dock_perf /backend/dock_perf

EXPOSE 3000

CMD ["/backend/dock_perf"]
