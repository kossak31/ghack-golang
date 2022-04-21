FROM ubuntu:18.04

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /docker-gs-ping


CMD [ "/docker-gs-ping" ]