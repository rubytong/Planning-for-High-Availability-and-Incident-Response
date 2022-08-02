# Infrastructure

## AWS Zones
us-east-2a, us-east-2b, us-east-2c
us-west-1a, us-west-1b

## Servers and Clusters

### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name | Brief description | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |

### Descriptions
- 1 EC2 instance running the website and API
- Custom AMI image used for EC2 instances
- SSH keys for administering the EC2 instances
- GitHub repo for storing the Terraform code
- 1-node RDS cluster running backend database for the website
- Backend Database backups daily and stored in S3 for recovery
- 1-node EKS cluster for running Grafana and Prometheus to monitor the web application

## DR Plan
### Pre-Steps:
Ensure the infrastructure is set up in the current region (us-east-1) is HA
- Update VPC with multiple availability zones
- Increase number of EC2 instances for the website and API to 3 (best). Make sure that they are spread across multiple availability zones
- Create cloud load balancer (LB) and attach EC2 instances to this LB
- Point DNS to the LB
- Instance number of nodes for EKS cluster used for monitoring to 3 (best) across different zones
- Increase number of nodes for SQL cluster to 3 (best) across multiple zones

Replicate the infrastructure to other region (us-west-1)

## Steps:
- Point DNS to the LB in another region
- Promote the replication database to be primary
