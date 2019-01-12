# AWS Ansible and Terraform Deploy Scripts

## Pre-requsites

* Linux Ubuntu
* Python (2.7 as Ansible still complains about Python 3)
* Terraform
* Ansible
* AWS CLI (and an AWS account)

## Set-up

**Docs are WIP and need updating**

### Set-up

Check python is installed and install pip.

```
python --version
apt get update
python-pip
```

#### Install Terraform

On macOS:
`brew install terraform`

On Linux Ubuntu:
Install Terraform via curl

`sudo curl -O https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip`

unzip to `/bin/terraform`

Add to path:

```
export PATH=$PATH:/bin/terraform
```

#### Install Ansible.

On macOS:
`brew install ansible`

On Linux Ubuntu:

```
sudo apt-get install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update

sudo apt-get install ansible

sudo vim /etc/ansible/ansible.cfg
# uncomment and set host_key_checking to False
```

Generate ssh keys.

```bash
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): /root/.ssh/kryptonite
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /root/.ssh/kryptonite.
Your public key has been saved in /root/.ssh/kryptonite.pub.

$ ssh-agent bash
$ ssh-add ~/.ssh/kryptonite

# confirm ssh was added
$ ssh-add -l
```

### IAM and DNS

AWS console - IAM - create a new user with programmatic access
Add appropriate policies to the user.
Download the credentials.

```bash
aws configure --profile superhero
# at the prompts, enter the key and secret key per the download
# enter a default region
# output format can be left as None
```

Route 53 reusable delegation set

```
aws route53 create-reusable-delegation-set --caller-reference 1224 --profile superhero
```

Add the nameservers to hosting config (e.g. in AWS Route 53 config, Namecheap or other registrar).


### Terraform

Add terraform script files.

Variables are added to `terraform.tfvars` which is git ignored i.e. do not check this file into git. A templated example is included as a reference.

Then run `terraform init` from the folder where the Terraform scripts are located.

To check Terraform scripts are accurate and to plan the output:

```bash
terraform plan
```

Use `terraform fmt --diff` to format the files.


### Ansible

s3update called manually, not by Terraform.

Add to the aws_hosts file e.g.

```
[dev]
<ip_address>
[dev:vars]
s3code=<atkinsdomain
domain=<atkinsdomain>
```

## Deploy

### Checklist

#### ssh agent
`ssh-add -l`

#### aws installed
aws --version

#### ansible installed and set-up
`ansible --version`

`vim /etc/ansible/ansible.cfg`
check `host_key_checking` is set to false

#### terraform installed
terraform --version
terraform plan

To deploy:

```
# safety first
terraform plan

# if all looks good
terraform apply

# to remove/destroy
terraform destroy
```
