FROM ubuntu:20.04

ADD ./bin/kubemocker /kubemocker

WORKDIR /

ENTRYPOINT [ "./kubemocker" ]
