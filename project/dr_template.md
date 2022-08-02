# Infrastructure

## AWS Zones
us-east-2a, us-east-2b, us-east-2c
us-west-1a, us-west-1b

## Servers and Clusters

### Table 1.1 Summary
| Asset                     | Purpose                                   | Size                                                                   | Qty                                                             | DR                                                                                                           |
|---------------------------|-------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name                | Brief description                         | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| EC2 instance              | Run webserver                             | t3.micro                                                               | 3                                                               | Multiple zones in us-east-2 region                                                                           |
| EKS cluster               | Run Grafana and Prometheus for monitoring | t3.medium                                                              | 2                                                               | Multiple zones in us-east-2 region                                                                           |
| VPC                       | Virtual Private network                   |                                                                        | 1                                                               | Multiple zones in us-east-2 region                                                                           |
| Application Load Balancer | Load balancing                            |                                                                        | 1                                                               |                                                                                                              |
| Primary RDS cluster       | Primary Database backend                  | db.t2.small                                                            | 2                                                               |                                                                                                              |
| Secondary RDS cluster     | Replication DB cluster                    | db.t2.small                                                            | 2                                                               | Used for DR                                                                                                  |
| Custom AMI image          |                                           |                                                                        |                                                                 |                                                                                                              |


### Descriptions
- 3 EC2 instances running the website and API
- 2-node RDS cluster running backend database for the website
- Backend Database backups daily and stored in S3 for recovery
- 2-node EKS cluster for running Grafana and Prometheus to monitor the web application

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
