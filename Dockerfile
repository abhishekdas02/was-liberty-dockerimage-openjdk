FROM centos:latest
LABEL maintainer="Abhishek Das <Abhishek_Das12@Infosys.com> (GitHub: @abhishekdas02)"

RUN yum install -y  unzip \
&& yum install java-1.7.0-openjdk.x86_64 -y \
&& yum clean all \
&& mkdir -p /tmp/ /opt/ibm/java

ADD ./installer/wlp-*.zip /tmp/wlp.zip

RUN unzip /tmp/wlp.zip -d /opt/ibm
ENV PATH /opt/ibm/wlp/bin:$PATH
ENV LOG_DIR /logs
ENV WLP_OUTPUT_DIR /opt/ibm/wlp/output

RUN mkdir /logs \
    && ln -s $WLP_OUTPUT_DIR/defaultServer /output \
    && ln -s /opt/ibm/wlp/usr/servers/defaultServer /config \
    && ln -s /opt/ibm /liberty \
    && /opt/ibm/wlp/bin/server create \
    && rm -rf $WLP_OUTPUT_DIR/.classCache

COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/

EXPOSE 9090 9443

CMD ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]
