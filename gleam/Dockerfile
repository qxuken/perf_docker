FROM tolalur/gleam:latest as backend-builder

WORKDIR /app

COPY . .

RUN gleam build

# --

FROM ghcr.io/gleam-lang/gleam:v1.2.1-erlang-alpine

COPY --from=backend-builder /app /build

RUN cd /build \
  && gleam export erlang-shipment \
  && mv build/erlang-shipment /app \
  && rm -r /build

WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]

EXPOSE 3000
CMD ["run"]
