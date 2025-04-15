aws cloudformation create-stack \
  --stack-name EKSStack \
  --template-body file://eks-cluster-cfn.yaml \
  --parameters \
    ParameterKey=ClusterName,ParameterValue=my-eks-cluster \
    ParameterKey=NodeGroupName,ParameterValue=my-node-group \
    ParameterKey=NodeInstanceType,ParameterValue=t3.medium \
    ParameterKey=DesiredCapacity,ParameterValue=2 \
  --capabilities CAPABILITY_NAMED_IAM \
  --region eu-north-1