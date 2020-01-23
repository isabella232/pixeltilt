FROM golang:1.13.6-alpine

RUN apk update && apk upgrade && apk add --no-cache git

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY frontend frontend
COPY storage storage

RUN GO111MODULE=on go build storage/main.go

EXPOSE 8081

CMD ["./main"]
