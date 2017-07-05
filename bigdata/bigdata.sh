kubectl create configmap hadoop --from-file k8s-config/bigdata/hadoop-core/config/
kubectl create configmap hive --from-file k8s-config/bigdata/hive/conf
kubectl create configmap hbase --from-file k8s-config/bigdata/hbase/conf
kubectl create configmap hue --from-file k8s-config/bigdata/hue/conf
kubectl create configmap spark --from-file k8s-config/bigdata/spark/conf
kubectl create configmap oozie --from-file k8s-config/bigdata/oozie/conf
kubectl create configmap sqoop --from-file k8s-config/bigdata/sqoop/conf
kubectl create configmap sentry --from-file k8s-config/bigdata/sentry/conf
kubectl create configmap impala --from-file k8s-config/bigdata/impala/conf
#zookeeper
kubectl apply -f k8s-config/bigdata/zookeeper/

#hdfs
kubectl apply -f k8s-config/bigdata/hadoop-core/hdfs/hdfs-journalnode.yml
kubectl apply -f k8s-config/bigdata/hadoop-core/hdfs/hdfs-namenode.yml
kubectl apply -f k8s-config/bigdata/hadoop-core/hdfs/hdfs-datanode.yml
kubectl apply -f k8s-config/bigdata/hadoop-core/hdfs/hdfs-httpfs.yml
#yarn
kubectl apply -f k8s-config/bigdata/hadoop-core/yarn/yarn-resoucemanager.yml
kubectl apply -f k8s-config/bigdata/hadoop-core/yarn/yarn-nodemanager.yml 
kubectl apply -f k8s-config/bigdata/hadoop-core/yarn/yarn-jobhistory.yml
kubectl apply -f k8s-config/bigdata/hadoop-core/yarn/yarn-proxyserver.yml
kubectl apply -f k8s-config/bigdata/hadoop-core/yarn/yarn-timeline.yml
#hbase
kubectl apply -f k8s-config/bigdata/hbase/hbase-master.yml

#hive
kubectl apply -f k8s-config/bigdata/hive/hive-metastore.yml
kubectl apply -f k8s-config/bigdata/hive/hive-hiveserver2.yml
#solr
kubectl apply -f k8s-config/bigdata/solr/solr.yaml
#sentry
kubectl apply -f k8s-config/bigdata/sentry/sentry.yml
#oozie
kubectl apply -f k8s-config/bigdata/oozie/oozie.yml
#spark
kubectl apply -f k8s-config/bigdata/spark/
#impala
kubectl apply -f k8s-config/bigdata/impala/
#hue
kubectl apply -f k8s-config/bigdata/hue/hue.yaml
