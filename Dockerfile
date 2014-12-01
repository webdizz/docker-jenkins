FROM webdizz/baseimage-java8:latest

MAINTAINER Izzet Mustafaiev "izzet@mustafaiev.com"

# Set correct environment variables.
ENV	HOME /root
ENV	LANG en_US.UTF-8
ENV	LC_ALL en_US.UTF-8
ENV	DEBIAN_FRONTEND	noninteractive

# set sane locale
RUN	locale-gen en_US.UTF-8
RUN mkdir -p /jenkins/plugins
RUN apt-get install -y git

ENV JENKINS_VERSION 1.591
RUN curl -sLo /opt/jenkins.war \
    http://mirrors.jenkins-ci.org/war/${JENKINS_VERSION}/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

RUN curl -sLo /jenkins/plugins/travis-yml.hpi \
    https://updates.jenkins-ci.org/latest/travis-yml.hpi
RUN curl -sLo /jenkins/plugins/git.hpi \
    https://updates.jenkins-ci.org/latest/git.hpi
RUN curl -sLo /jenkins/plugins/ruby-runtime.hpi \
    https://updates.jenkins-ci.org/latest/ruby-runtime.hpi
RUN curl -sLo /jenkins/plugins/git-client.hpi \
    https://updates.jenkins-ci.org/latest/git-client.hpi
RUN curl -sLo /jenkins/plugins/scm-api.hpi \
    https://updates.jenkins-ci.org/latest/scm-api.hpi
RUN curl -sLo /jenkins/plugins/build-flow-plugin.hpi \
    https://updates.jenkins-ci.org/latest/build-flow-plugin.hpi
RUN curl -sLo /jenkins/plugins/buildgraph-view.hpi \
    https://updates.jenkins-ci.org/latest/buildgraph-view.hpi
RUN curl -sLo /jenkins/plugins/parameterized-trigger.hpi \
    https://updates.jenkins-ci.org/latest/parameterized-trigger.hpi
RUN curl -sLo /jenkins/plugins/cloudbees-folder.hpi \
    https://updates.jenkins-ci.org/latest/cloudbees-folder.hpi
RUN curl -sLo /jenkins/plugins/credentials.hpi \
    https://updates.jenkins-ci.org/latest/credentials.hpi
RUN curl -sLo /jenkins/plugins/jobolizer.hpi \
    http://dl.bintray.com/webdizz/maven/jobolizer.hpi

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
CMD [""]