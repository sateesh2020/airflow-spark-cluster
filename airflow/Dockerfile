FROM apache/airflow:2.7.1-python3.11

USER root
RUN apt-get update && \
    apt-get install -y gcc python3-dev openjdk-11-jdk procps wget iputils-ping && \
    apt-get clean

ARG SPARK_VERSION=3.5.1
ARG HADOOP_VERSION=3
ARG SCALA_VERSION=2.13
# Set JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN export JAVA_HOME
#RUN chmod 777 /usr/lib/jvm/java-11-openjdk-amd64/

# ENV SPARK_HOME /usr/local/spark

# ARG SPARK_FILE="spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}"
# # Spark submit binaries and jars (Spark binaries must be the same version of spark cluster)
# RUN cd "/tmp" && \
#         wget --no-verbose "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_FILE}.tgz" && \
#         tar -xvzf "${SPARK_FILE}.tgz" && \
#         # mkdir -p "${SPARK_HOME}/bin" && \
#         # mkdir -p "${SPARK_HOME}/assembly/target/scala-${SCALA_VERSION}}/jars" && \
#         cp -a "${SPARK_FILE}/." "${SPARK_HOME}/" && \
#         # cp -a "${SPARK_FILE}/jars/." "${SPARK_HOME}/assembly/target/scala-${SCALA_VERSION}/jars/" && \
#         rm "${SPARK_FILE}.tgz"

# RUN export SPARK_HOME
# ENV PATH $PATH:/usr/local/spark/bin

#RUN chmod 777 /usr/local/spark/
USER airflow

RUN pip install apache-airflow apache-airflow-providers-apache-spark pyspark
