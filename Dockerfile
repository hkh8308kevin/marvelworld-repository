FROM adoptopenjdk/openjdk11:alpine-jre

LABEL maintainer="dohun.ham@cloudmt.co.kr"
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY marvelworld2.war .
ENTRYPOINT ["java","-jar","marvelworld2.war"]


