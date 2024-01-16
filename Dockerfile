FROM docker:24.0-dind

RUN apk --no-cache add bash git

ENV OLS_HOME /app

RUN mkdir $OLS_HOME
WORKDIR $OLS_HOME

RUN git clone -b stable --depth 1 https://github.com/EBISPOT/ols4

# set compose CONFIG file path Tweked to target dataload dockerfile expected path:
ENV OLS4_CONFIG "/opt/dataload/configs/ols-ensembl-config.json"
ENV COMPOSE_FILE "${OLS_HOME}/ols4/docker-compose.yml"
ENV DOCKER_HOST "unix:////var/run/docker.sock"
ENV DOCKER_DRIVER "overlay2"

ADD dataload.dockersh ${OLS_HOME}/ols4/dataload/
ADD ols-ensembl-config.json ${OLS_HOME}/ols4/dataload/configs/
ADD docker-compose.yml ${OLS_HOME}/ols4/
ADD entrypoint.sh ${OLS_HOME}
EXPOSE 8080
# CMD ["docker", "compose", "up", "--quiet-pull", "--no-attach", "ols4-dataload"]
CMD ["/bin/bash"]
# "| grep ols4"]
# CMD ["/app/entrypoin1t.sh"]::