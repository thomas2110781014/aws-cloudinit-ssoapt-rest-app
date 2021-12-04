output "ec2_global_ips" {
  value = ["${aws_instance.ec2-dockerhost.*.public_dns}"]
}