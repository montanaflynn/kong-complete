FROM debian:jessie
MAINTAINER Montana Flynn <montana@montanaflynn.me>

RUN apt-get update && apt-get install -y sudo curl wget ca-certificates && \
	mkdir -p /usr/lib/jvm/ && \
	curl --silent --location --retry 3 --cacert /etc/ssl/certs/GeoTrust_Global_CA.pem \
    --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jre-8u45-linux-x64.tar.gz \
    | tar xz --strip-components=1 -C /usr/lib/jvm/ && \
	mkdir -p /usr/lib/cassandra/ && \
	curl --silent http://ftp.wayne.edu/apache/cassandra/2.1.5/apache-cassandra-2.1.5-bin.tar.gz \
    | tar xz --strip-components=1 -C /usr/lib/cassandra/ && \
	apt-get update && apt-get install -y lua5.1 openssl dnsmasq netcat libpcre3 && \
	wget https://github.com/Mashape/kong/releases/download/0.3.2/kong-0.3.2.wheezy_all.deb && \
	sudo dpkg -i kong-0.3.2.*.deb && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm
ENV PATH $JAVA_HOME/bin:$PATH
ENV CASS_HOME /usr/lib/cassandra
ENV PATH $CASS_HOME/bin:$PATH

EXPOSE 7199 7000 7001 9160 9042 22 8012 61621 8000 8001
