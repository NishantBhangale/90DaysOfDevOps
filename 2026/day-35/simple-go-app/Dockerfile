FROM golang:1.26 AS builder

WORKDIR /app

COPY . . 

FROM golang:alpine

RUN apk add --no-cache ca-certificates

WORKDIR /root/

COPY --from=builder /app . 

EXPOSE 8080

CMD ["go","run","main.go"]
