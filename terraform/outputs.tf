# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.host.public_ip
}

# Output the private IP of the instance
output "instance_private_ip" {
  value = aws_instance.host.private_ip
}