FROM docker.io/openjdk:8
RUN mkdir /app
WORKDIR /app
COPY ./data-integration _build.sh entrypoint.sh /app/
ENV TZ=Asia/Shanghai

RUN /app/_build.sh

EXPOSE 8080
HEALTHCHECK  curl -u cluster:cluster localhost:8080/kettle/status/ -d xml=y

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/app/carte.sh", "0.0.0.0", "8080"]

