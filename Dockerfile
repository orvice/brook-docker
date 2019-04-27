FROM golang:alpine as builder
RUN apk add --update git
RUN go get github.com/txthinking/brook/cli/brook


FROM orvice/go-runtime


# /usr/bin/brook
COPY --from=builder /go/bin /usr/bin

USER nobody
ENV ARGS="server -l :6060 -p password"
EXPOSE 6060/tcp 6060/udp

CMD /usr/bin/brook ${ARGS}
