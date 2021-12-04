output "REST API Backend" {
  value = ["${aws_instance.ec2-dockerhost.*.public_ip}.nip.io:8000"]
}

output "PHP Frontend" {
  value = ["${aws_instance.ec2-dockerhost.*.public_ip}.nip.io"]
}
