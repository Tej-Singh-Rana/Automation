FROM centos
WORKDIR /root
# install openjdk hadoop 2.7.3 and wget
RUN yum install -y which tar wget openssh-server && \
    wget ftp://192.168.10.254/pub/adhoc/Apache_Hadoop/hadoop-2.7.3.tar.gz && \
    wget ftp://192.168.10.254/pub/ashutoshh/jdk-8u121-linux-x64.rpm && \
    tar -xzf hadoop-2.7.3.tar.gz && \
    rm hadoop-2.7.3.tar.gz && \
    mv hadoop-2.7.3 /hadoop2 && \
    rpm -i jdk-8u121-linux-x64.rpm

# set environment variable
ENV JAVA_HOME=/usr/java/jdk1.8.0_121
ENV HADOOP_HOME=/hadoop2
ENV PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

COPY config/* /tmp/


RUN mv /tmp/core-site.xml /hadoop2/etc/hadoop/core-site.xml && \
    mv /tmp/hdfs-site.xml /hadoop2/etc/hadoop/hdfs-site.xml && \
    mv /tmp/yarn-site.xml /hadoop2/etc/hadoop/yarn-site.xml && \
    mv /tmp/mapred-site.xml /hadoop2/etc/hadoop/mapred-site.xml && \
    mv /tmp/hadoop-env.sh /hadoop2/etc/hadoop/hadoop-env.sh && \
    cat /tmp/hosts >> /etc/hosts && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh

RUN chmod +x ~/start-hadoop.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh 

# format namenode
RUN /hadoop2/bin/hdfs namenode -format
RUN $HADOOP_HOME/sbin/hadoop-daemon.sh start namenode
RUN $HADOOP_HOME/sbin/yarn-daemon.sh start resourcemanager

CMD [ "sh", "-c", "service ssh start; bash"]
#   mv hosts hadoop-env.sh hdfs-site.xml core-site.xml mapred-site.xml yarn-site.xml /opt/
#RUN cd /opt/ && cat hosts >> /etc/hosts && cp hdfs-site.xml core-site.xml mapred-site.xml yarn-site.xml /hadoop2/etc/hadoop/
#COPY .bashrc /root/.bashrc



