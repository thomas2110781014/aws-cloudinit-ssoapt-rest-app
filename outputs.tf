output "REST_API_Backend" {
  value = "https://${aws_instance.ec2-dockerhost.public_ip}.nip.io:8000"
}

output "PHP_Frontend" {
  value = "https://${aws_instance.ec2-dockerhost.public_ip}.nip.io"
}
