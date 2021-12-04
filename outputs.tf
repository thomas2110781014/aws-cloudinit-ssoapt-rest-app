output "REST_API_Backend" {
  value = ["${aws_instance.ec2-dockerhost.*.public_ip}.nip.io:8000"]
}

output "PHP_Frontend" {
  value = ["${aws_instance.ec2-dockerhost.*.public_ip}.nip.io"]
}
