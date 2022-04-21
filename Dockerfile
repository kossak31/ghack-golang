FROM golang:1.18-alpine


WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 go build -o /docker-gs-ping


CMD [ "/docker-gs-ping" ]