FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o echo-app main.go

FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/echo-app .

EXPOSE 8080
ENTRYPOINT ["./echo-app"]
