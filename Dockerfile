FROM busybox:latest 

ADD ./bin/kubemocker /kubemocker

WORKDIR /

ENTRYPOINT [ "./kubemocker" ]
