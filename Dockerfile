# 第一阶段：构建 Go 应用
FROM golang:1.16 as builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o server

# 第二阶段：构建精简镜像
FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/server .

EXPOSE 8080

CMD ["./server"]
