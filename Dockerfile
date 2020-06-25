FROM golang:alpine

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go get github.com/githubnemo/CompileDaemon

ENTRYPOINT CompileDaemon -exclude-dir=.git --build="go build main.go" --command="./main serve"