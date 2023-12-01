FROM docker:dind

RUN apk --no-cache add git bash # docker-compose

ENV OLS_HOME /opt/ols/
RUN mkdir $OLS_HOME
WORKDIR $OLS_HOME

RUN git clone --branch stable --depth 1 https://github.com/EBISPOT/ols4.git ${OLS_HOME}/ols4
# ADD ols4 $OLS_HOME
# ADD configuration files
ADD ols-config.json ${OLS_HOME}/ols4/dataload/configs/
ADD phi.obo ${OLS_HOME}
ADD docker-compose.yml ${OLS_HOME}
ADD entrypoint.sh ${OLS_HOME}
# set compose CONFIG file path
ENV OLS4_CONFIG "./dataload/configs/ols-config.json"

EXPOSE 8080
#ENTRYPOINT ["/opt/ols/entrypoint.sh"]
CMD ["sh"]