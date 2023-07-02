FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY main.go ./

RUN go build -o fullcycle main.go

FROM scratch AS final

WORKDIR /app

COPY --from=builder /app/fullcycle /app/

ENTRYPOINT ["/app/fullcycle"]
