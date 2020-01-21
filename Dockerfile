FROM centos
RUN yum install -y which tar
COPY  hadoop-2.7.3.tar.gz /
RUN cd /  && tar -xzf hadoop-2.7.3.tar.gz && rm hadoop-2.7.3.tar.gz 
RUN mv /hadoop-2.7.3 /hadoop2
COPY jdk-8u121-linux-x64.rpm /
RUN cd / && rpm -i jdk-8u121-linux-x64.rpm
COPY .bashrc /root/.bashrc
RUN source /root/.bashrc
EXPOSE 8088 50070 50075 50030 50060 50090 



