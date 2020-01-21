FROM hadoop:v1

COPY hosts hdfs-site.xml core-site.xml mapred-site.xml yarn-site.xml /opt/
RUN cd /opt/ && cat hosts >> /etc/hosts \
    
COPY .bashrc /root/.bashrc
RUN source /root/.bashrc


