query=$1
echo $query
#chmod 755 minerva_hive.sh
#aws ec2 create-key-pair --key-name emr-keypair --query 'mlkey86' --output text > emr-keypair.pem --profile usrmll
#chmod 400 emr-keypair.pem
#MY_IP=191.99.4.35 #my ip
#MY_VPC=vpc-0a8deb7833a41f00d #my vpc id
#aws ec2 create-security-group --group-name ssh-my-ip --description "For SSHing from my IP" --vpc-id $MY_VPC --profile usrmll #for the first time
echo "Start Hive"
date
SUBNET_ID=subnet-32106c1f #Public subnet subnet-025a581e6a93be02c
MY_SG=sg-0af3e4ea0a0a50680 #The security group matched with vpc
CLUSTER_ID=$(aws emr create-cluster --name autoClusterHive --applications Name=Hadoop Name=Hive --configurations file://conf_emr_hive.json --release-label emr-6.13.0 --use-default-roles \
  --instance-groups InstanceGroupType=MASTER,Name=Master,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=CORE,Name=Core,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-1,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-2,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-3,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-4,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-5,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-6,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-7,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-8,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-9,InstanceCount=1,InstanceType=m5.xlarge \
  InstanceGroupType=TASK,Name=Task-10,InstanceCount=1,InstanceType=m5.xlarge \
  --log-uri s3://bigdatamell/log_hive --ec2-attributes KeyName=emr-keypair,AdditionalMasterSecurityGroups=$MY_SG,SubnetId=$SUBNET_ID --no-auto-terminate --profile usrmll | jq -r ".ClusterId")
echo $CLUSTER_ID
ACTIVE_CLUSTER=$(aws emr list-clusters --cluster-states WAITING --profile usrmll | jq -r ".Clusters")
while [[ "$ACTIVE_CLUSTER" == "[]" ]];
do
echo $ACTIVE_CLUSTER
sleep 10
ACTIVE_CLUSTER=$(aws emr list-clusters --cluster-states WAITING --profile usrmll | jq -r ".Clusters")
done
echo "Success Cluster"
date
MASTER_URL=$(aws emr describe-cluster --cluster-id $CLUSTER_ID --profile usrmll | jq -r ".Cluster.MasterPublicDnsName")
echo $MASTER_URL
expect interaccion.exp $MASTER_URL $query
#ejecutar el query leido desde archivo
#concatenar fecha hora y guardar en variable para proximos pasos
#Esperar hasta la salida y guardar los resultados en bucket s3 -> ok
#hacer que tome el archivo de query a ejecutar por parametro
ssh -o "ServerAliveInterval=60" ec2-user@$MASTER_URL -i emr-keypair.pem "sudo su -c 'mv /home/ec2-user/tpcds_query.sql /root/tpcds_query.sql;cd /root;hive -f tpcds_query.sql>tpcds_query.out;aws s3 cp tpcds_query.out s3://bigdatamell/log_hive/$query.out;exit;exit'"
echo "Finish Query Hive"
date
aws emr terminate-clusters --cluster-ids $CLUSTER_ID --profile usrmll
#aws emr list-clusters --cluster-states WAITING --profile usrmll
exit
