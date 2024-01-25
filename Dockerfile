# The stage at which the application is built
FROM golang:alpine3.18 AS builder
RUN apk update && apk add --no-cache git
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/app .

# The stage at which the application is deployed
FROM alpine:3
COPY --from=builder /go/bin/app /go/bin/app
EXPOSE 5000
ENTRYPOINT ["/go/bin/app"]

# The Dockerfile above is a multi-stage build. 
# The first stage is the builder stage, which is used to build the application. 
# The second stage is the deployment stage, which is used to deploy the application. 
# The --platform=linux/arm64 flag is used to specify the platform of the image. 
# The --from=builder flag is used to specify the stage from which the image is copied.
