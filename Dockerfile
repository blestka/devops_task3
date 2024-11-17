FROM public.ecr.aws/docker/library/gradle:8.0.2 AS BUILD
RUN mkdir -p /opt/build/app
WORKDIR /opt/build/app
ADD . /opt/build/app
RUN gradle clean build -x test

FROM public.ecr.aws/docker/library/openjdk:17-jdk as APP

RUN groupadd devgrp
RUN useradd -g devgrp -m -d /opt/task3 task3
USER task3:devgrp

RUN mkdir -p /opt/task3/lib

COPY --from=BUILD --chown=task3:devgrp /opt/build/app/build/libs/devops-task3-0.0.1-SNAPSHOT.jar /opt/task3/lib/app.jar

ENV DEVOPS=tatsiana.drabovich

WORKDIR /opt/task3
ENTRYPOINT [ "java", "-jar", "/opt/task3/lib/app.jar" ]
