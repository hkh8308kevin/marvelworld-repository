FROM adoptopenjdk/openjdk11:alpine-jre

LABEL maintainer="dohun.ham@cloudmt.co.kr"
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mv marvelworld-0.0.1-SNAPSHOT.war marvelworld.war 
COPY marvelworld .
ENTRYPOINT ["java","-jar","marvelworld.war"]


