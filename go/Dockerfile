FROM golang:1.22-alpine as backend-builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /app/docker_perf

# ---

FROM alpine:latest

COPY --from=backend-builder /app/docker_perf /backend/docker_perf

EXPOSE 3000
CMD ["/backend/docker_perf"]
