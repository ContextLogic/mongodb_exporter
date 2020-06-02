FROM golang:1.14-alpine3.11 as builder
COPY . /go/src/github.com/dcu/mongodb_exporter
WORKDIR /go/src/github.com/dcu/mongodb_exporter
RUN go build -o /mongoexporter github.com/dcu/mongodb_exporter

FROM alpine:3.11
ENV GOTRACEBACK=single
CMD ["./mongoexporter"]
COPY --from=builder /mongoexporter .
