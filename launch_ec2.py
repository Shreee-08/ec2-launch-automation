import boto3
import json

# Load variables from file
with open('variables.json') as f:
    vars = json.load(f)

ec2 = boto3.client('ec2')

response = ec2.run_instances(
    ImageId=vars['IMAGE_ID'],
    InstanceType=vars['INSTANCE_TYPE'],
    KeyName=vars['KEY_NAME'],
    MinCount=1,
    MaxCount=1,
    SecurityGroupIds=[vars['SECURITY_GROUP']],
    SubnetId=vars['SUBNET_ID'],
    TagSpecifications=[{
        'ResourceType': 'instance',
        'Tags': [{'Key': 'Name', 'Value': vars['INSTANCE_NAME']}]
    }]
)

instance_id = response['Instances'][0]['InstanceId']
print(f"Instance Launched → {instance_id}")

# Fetch Public IP
desc = ec2.describe_instances(InstanceIds=[instance_id])
public_ip = desc['Reservations'][0]['Instances'][0].get('PublicIpAddress')
print(f"Public IP → {public_ip}")

