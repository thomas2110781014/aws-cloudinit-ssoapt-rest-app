## Description

This terraform project creates an EC2 instance on AWS,
installs docker and docker-compose with cloud-init,
and then clones the github repo 
https://github.com/thomas2110781014/ssoapt-nginx-certbot-golang-postgres-php
and runs the app.

## Prerequisites

- install [Terraform](https://www.terraform.io/downloads)
- provide your AWS credentials

You can do this by saving them to `~/.aws/credentials` in your user home directory ([official docu](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)).

## How to run

Download the repo with `git clone https://github.com/thomas2110781014/aws-cloudinit-ssoapt-rest-app.git` or alternatively download the zip archive.
Change into the directory. Then use terraform to deploy.

```
terraform init
terraform apply -auto-approve
```
Wait <b>5-10 minutes</b> until it's finished installing and provisioning.
You will see the URL of the service, navigate to this address via HTTP/HTTPS!
On port 8000 you can experiment with the backend REST API.
To remove afterwards, use `terraform destroy -auto-approve`.

## SSH public key

To be able to ssh into your EC2 instance,
you can supply your own public ssh key by creating the file `sshkey.tf`:

```
resource "aws_key_pair" "mysshkey" {
  key_name   = "mysshkey"
  public_key = "ssh-rsa AAAA....."
}
```

Enter your own key as value of `public_key`.

Also, you must add `key_name = "mysshkey"` to the file `main.tf`.

It should then look like this:

```
resource "aws_instance" "ec2-dockerhost" {
  ami = data.aws_ami.amazon-2.id
  instance_type = "t3.micro"
  key_name   = "mysshkey"

  ...
```


