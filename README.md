## What is this for?

This terraform project creates an EC2 instance on AWS,
installs docker and docker-compose with cloud-init,
and then clones the github repo 
`https://github.com/thomas2110781014/ssoapt-nginx-certbot-golang-postgres-php`
and runs the app.

## Run

```
terraform init
terraform apply -auto-approve
```

After applying, you will see the public DNS address of the service.
Navigate to this address via HTTP/HTTPS!

On port 8000 you can experiment with the backend REST API.

To remove afterwards, use `terraform destroy -auto-approve`.

## SSH public key

To be able to ssh into your EC2 instance,
you can supply your own public ssh key by creating the file `sshkey.tf`
and entering code like this:

```
resource "aws_key_pair" "mysshkey" {
  key_name   = "mysshkey"
  public_key = "ssh-rsa AAAA....."
}
```

Enter your key as value of `public_key`.


