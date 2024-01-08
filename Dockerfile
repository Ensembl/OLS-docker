FROM docker:24.0-dind

RUN apk --no-cache add bash

ENV OLS_HOME /app
RUN mkdir $OLS_HOME
WORKDIR $OLS_HOME

ADD ols4 $OLS_HOME/ols4/
# ADD images $OLS_HOME/
ADD ols-config.json ${OLS_HOME}/ols4/dataload/configs/
ADD phi.obo ${OLS_HOME}
ADD docker-compose.yml ${OLS_HOME}
ADD entrypoint.sh ${OLS_HOME}
# set compose CONFIG file path
ENV OLS4_CONFIG "./dataload/configs/ols-config.json"
ENV COMPOSE_FILE "${OLS_HOME}/docker-compose.yml"

EXPOSE 8080
# ENTRYPOINT ["/opt/ols/entrypoint.sh"]
# "docker", "compose", "up", "-d"]
CMD ["sh"]