ARG version
FROM almalinux:${version:-9}
ENV course="devops" \
    duration="120hrs"
ARG trainer="sivakumar"
ENV trainer=$trainer
RUN echo "Hi, Course is: ${course}, duration is: ${duration}, trainer is: ${trainer}, version: ${version}"
CMD ["sleep", "1000"]

# A. ARG is the instruction used to hold variables at the build time. 
# We can pass the values from command line using --build-arg KEY=VALUE
# docker build --build-arg USERNAME=sivakumar -t image-name: version
# ARG variables are valid only for build time and not valid at the time the container is running.
# ARG is the only instruction that can be written before FROM, ARG before FROM is valid till FROM statement only.
# ENV is the instruction used to hold variables at the build time and container as well.
# We mix ENV and ARG for best results, like assigning the value of ARG to ENV variables.
