FROM golang:1.16-alpine
RUN mkdir /app 
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -v -o main

CMD ["./main"]