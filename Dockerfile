FROM adoptopenjdk/openjdk11:alpine-jre

LABEL maintainer="dohun.ham@cloudmt.co.kr"
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG WAR_FILE=marvelworld-0.0.1-SNAPSHOT.war
ADD ./${WAR_FILE} marvelworld.war
ENTRYPOINT ["java","-jar","marvelworld.war"]


