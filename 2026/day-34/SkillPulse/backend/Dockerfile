FROM golang:1.26-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

#####------ Stage 1 -----#######
FROM alpine:latest AS runner

RUN apk --no-cache add ca-certificates

RUN adduser -D -u 10001 appuser

WORKDIR /app

COPY --from=builder /app/main .

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8080

CMD ["./main"]