
####     Create VPC

#### Vpc and more
* **Name tag auto-generation** 
    Name: `dawgs_armageddon` 
* **IPv4 CIDR block**
    IPv4 CIDR block: `10.75.0.0/16`
* **Number of avavailability zones** (2)
* **Number of public subnets** (2)
* **Number of private subnets** (2)
* **NAT gateways** (none)
* **VPC ENDPOINTS** (none)
* **DNS options:** 
    "Enable DNS hostnames" "Enables DNS resoultions"
*   **Create VPC**

####     Create Security Group

#### Basic details
* **Name** `ec2-lab-sg`
* **VPC**   `dawgs_armegeddon`
*   **Inbound rules**
* **HTTP** `PORT 80` & **SSH** `PORT 22`
    **Outbound rules** ** DO NOT TOUCH**
    ** Create security group**

####     Policy & Roles

Policy & Roles to allows EC2 to get secret:
	- For this will create the need permissions policy first, then attach it to the role along with the proper principal,
	- permission policy:

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ReadOnlyListActions",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeSecurityGroups",
                "rds:DescribeDBInstances"
            ],
            "Resource": "*"
        },
        {
            "Sid": "ReadSpecificSecret",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:GetSecretValue"
            ],
            "Resource": "arn:aws:secretsmanager:<region>:<account Id>:secret:lab/rds/mysql*"
        }
    ]
}

####      Launch instance

#### Name and tags 
* **Name** `ec2-lab-sg`
* **Allpication and OS images (Amazon machine Image)
    `Amazon Linux`
* **Instance Type** `tt3.micro`
* **Key pair** `create`
* **Network setting**
* **VPC** `dawg_Armageddon`
* ** Subnet** `public`
* **Auto-assign public IP** `Enable`
* **Firewall (security groups)** `ec2-lab-sg` 
* **Advanced details** `user_data`
    **Launch instance**

####    Aurora and RDS

#### Datatabases
* **Create database**
* **Choose a database creation method** `Full configuration`
* **Engine options** `Mysql`
* **Templates** `Dev/Test`
* **Availability and durability** `Single-AZ DB instance deployment (1instance)`
* **Setting** `lab-mysql`
* **Master username** `admin`
* **Credentials management** `Self managed`
* **Master password** `*******`
* **Confirm masterpassword** `********`
* **Connectivity** `Connect to an EC2 compute resource`
* **EC2 instance** `ec2-lab-sg`
* *Virtual private cloud (VPC)** `automatically selected`
* **DB subnet** `automatic setup`
* **Public access** `No`
* **Vpc security gourp(firewall)** `create new` `rds-lab-sg`
* **Additional monitoring settings** 
* **Log exports** `enable all of them`
    * ** Create database**

####    Secret Manager

#### Store a new secret
* **Secret type** `Credentials for Amazon RDS database` 
* **Credentials** `admin`
* **password** `*******`
* **Database** `lab-mysql` 
* **Secret name and description** (same as policy) `lab/rds/mysql` 
`next`
`next`
* **Review** `Store`




####    Instance
* **Action** `Security` `modify iam role` `ec2_secret_role` 
* **Update IAM role**

####    SSH

   \- aws rds describe-db-instances \--db-instance-identifier lab-mysql \--query "DBInstances\[\].Endpoint"  
   \- aws secretsmanager get-secret-value \--secret-id lab/rds/mysql  
   \- mysql \-h \<RDS\_ENDPOINT\> \-u admin \-p  
   \- SHOW DATABASES;  
   \- CREATE DATABASE labdb;  
   \- sudo systemctl restart rdsapp  
   \- systemctl start rdsapp  
   \- On web page add the following with a "/" after the wed address  
   \- add?note=cloud\_labs\_are\_real  
   \- add more notes and screenshot

#### Verification

```text
http://<public_ip>
http://<public_ip>/init
http://<public_ip>/add?note=test_note
```