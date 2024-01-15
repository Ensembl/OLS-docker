FROM docker:24.0-dind

RUN apk --no-cache add bash git

ENV OLS_HOME /app
RUN mkdir $OLS_HOME
WORKDIR $OLS_HOME

# ADD ols4 $OLS_HOME/ols4/
# https://github.com/Ensembl/ensembl-ols4
RUN git clone -b stable --depth 1 https://github.com/EBISPOT/ols4
# ADD images $OLS_HOME/
ADD phi.obo ${OLS_HOME}
ADD entry_point.sh ${OLS_HOME}
ADD docker-compose.yml ${OLS_HOME}/ols4/
# set compose CONFIG file path Tweked to target dataload dockerfile expected path:
ENV OLS4_CONFIG "/opt/dataload/configs/ensembl-test-config.json"
ENV COMPOSE_FILE "${OLS_HOME}/ols4/docker-compose.yml"

# CMD [ "docker", "compose", "up"]
# CMD [ "/bin/sh", ""]
ENTRYPOINT [ "/bin/bash", "-c", "${OLS_HOME}/entry_point.sh"]