FROM golang:alpine

# Create and change to the app directory.
WORKDIR /app
# Retrieve application dependencies.
# This allows the container build to reuse cached dependencies.
# Expecting to copy go.mod and if present go.sum.
COPY go.mod .
COPY go.sum .
RUN go mod download
# Copy local code to the container image.

EXPOSE 8080

COPY . .
# Build the binary.
RUN go build -o ./out/dist .
RUN ["./out/dist"]