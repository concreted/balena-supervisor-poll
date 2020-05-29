FROM alpine:3.11.6@sha256:39eda93d15866957feaee28f8fc5adb545276a64147445c64992ef69804dbf01 as run

# If any dependencies are necessary, install them here.
RUN apk add --no-cache curl bash

FROM balenalib/intel-nuc-alpine-golang:1-3.11-20200502 as build

# RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
# RUN  mkdir -p /go/src \
#   && mkdir -p /go/bin \
#   && mkdir -p /go/pkg
# ENV GOPATH=/go
# ENV PATH=$GOPATH/bin:$PATH

# RUN mkdir -p /go/src/github.com/mirainc/screenray/metrics
# WORKDIR /go/src/github.com/mirainc/screenray/metrics

# COPY utils /go/src/github.com/mirainc/screenray/utils
# RUN cd /go/src/github.com/mirainc/screenray/utils && dep ensure -vendor-only

# COPY metrics/main.go .
# COPY metrics/Gopkg.lock .
# COPY metrics/Gopkg.toml .

# RUN dep ensure -vendor-only
# RUN go build

# RUN mkdir -p /build
# RUN mv ./metrics /build

FROM run

WORKDIR /usr/src/app

# COPY --from=build /build/metrics .
COPY run.sh .
RUN chmod +x ./run.sh

CMD ["./run.sh"]
