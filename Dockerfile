FROM golang:1.18.3-alpine as intermediate

RUN  apk update && apk upgrade && apk add --no-cache bash git curl

COPY ./mycode/*.* /app/

RUN  cd /app && go mod download
RUN  cd /app && CGO_ENABLED=0 go build -o custom_metric

FROM alpine:latest
COPY --from=intermediate /app/custom_metric /app/custom_metric
WORKDIR /app
EXPOSE 8181
ENTRYPOINT ["/app/custom_metric"]
