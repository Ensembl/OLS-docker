FROM alpinelinux/docker-compose

# RUN apk update
RUN apk --no-cache add git bash # docker-compose

ENV OLS_HOME /opt/ols/
RUN mkdir $OLS_HOME
WORKDIR $OLS_HOME
RUN git clone --branch stable --depth 1 https://github.com/EBISPOT/ols4.git ${OLS_HOME}
# ADD configuration files
ADD ols-config.json ${OLS_HOME}
ADD phi.obo ${OLS_HOME}
# set compose CONFIG file path
ENV OLS4_CONFIG "./ols-config.json"
# ENV DOCKER_HOST "tcp://docker:2375"
# ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["docker", "compose", "up"]
EXPOSE 8080
# CMD ["sh"]