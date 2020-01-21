FROM hadoop:v1

COPY hosts hadoop-env.sh hdfs-site.xml core-site.xml mapred-site.xml yarn-site.xml /opt/
RUN cd /opt/ && cat hosts >> /etc/hosts && cp hdfs-site.xml core-site.xml mapred-site.xml yarn-site.xml /hadoop2/etc/hadoop/  
COPY .bashrc /root/.bashrc
RUN source /root/.bashrc


