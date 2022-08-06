# Infrastructure

## AWS Zones
us-east-2a, us-east-2b, us-east-2c
us-west-1a, us-west-1b

## Servers and Clusters

### Table 1.1 Summary
| Asset                     | Purpose                                   | Size        | Qty | DR                                 |
|---------------------------|-------------------------------------------|-------------|-----|------------------------------------|
<<<<<<< HEAD
| EC2 instance              | Run webserver                             | t3.micro    | 6   | 3 ones across 3 multiple zones in us-east-2 region to ensure HA, 3 ones across 2 zones in us-west-1 for DR|
| EKS cluster               | Run Grafana and Prometheus for monitoring | t3.medium   | 2   | 2 nodes acorss differnet zones per cluster for HA, one cluster in us-east-2 region and other one in us-west-1 for DR |
| VPC                       | Virtual Private network                   |             | 2  | Multiple zones per VPC, one VPC in us-east-2 and other one in us-west-1 for DR |
| Application Load Balancer | Load balancing                            |             | 2   | One LB in us-east-2 and other one in us-west-1                               |
| RDS cluster       | Database backend                  | db.t2.small | 2   | 2 nodes acorss differnet zones per cluster for HA, one primary cluster in us-east-2 region and other one is replication in us-west-1 for DR |                               |
### Descriptions
- 3 EC2 instances running the website and API
- 2-node Primary RDS clusters running backend database for the website
- 2-node Secondary RDS clusters for replication db
- VPC
- Application Load Balancer for balancing traffic
- 2-node EKS cluster for running Grafana and Prometheus to monitor the web application
=======
| EC2 instance              | Run webserver                             | t3.micro    | 6   | 3 ones distributed evently across multiple zones in us-east-2 region to ensure HA, 3 ones distributed evently across multiple zones in us-west-1 region for DR|
| EKS cluster               | Run Grafana and Prometheus for monitoring | t3.medium   | 2   | 2 nodes distributed evently across multiple zones per cluster for HA, one cluster in us-east-2 region and other one in us-west-1 for DR |
| VPC                       | Virtual Private network                   |             | 2  | Multiple zones per VPC, one VPC in us-east-2 and other one in us-west-1 for DR |
| Application Load Balancer | Load balancing                            |             | 2   | One LB in us-east-2 and other one in us-west-1                               |
| RDS cluster       | Database backend                  | db.t2.small | 2   | 2 nodes distributed evently across multiple zones per cluster for HA, one primary cluster in us-east-2 region and other one is replication in us-west-1 for DR |                               |
### Descriptions
- EC2 instances running the website and API
- Primary RDS cluster running backend database for the website
- Secondary RDS cluster for replication db
- VPCs to launch AWS resources in a logically isolated virtual network
- Application Load Balancers for balancing traffic across EC2 instances in multiple zones
- EKS clusters for running Grafana and Prometheus to monitor the web application
>>>>>>> 896a5ffbd945986c8cab098ce3425f089316c949

## DR Plan
### Pre-Steps:
Ensure the infrastructure is set up in the current region (us-east-2) is HA
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
