FROM almalinux:9
RUN mkdir /tmp/workdir-demo
#RUN cd /tmp/workdir-demo  # this will not work
WORKDIR /tmp/workdir-demo
RUN pwd
RUN echo "Hello I am in work dir" > hello.txt
CMD ["sleep","1000"]

# workdir /tmp/workdir-demo - navigate to required directory -