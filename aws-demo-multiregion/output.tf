output public_ip_us_east_1 {
  value       = aws_instance.us-east-1.public_ip
}

output public_ip_us_west_1 {
  value       = aws_instance.us-west-1.public_ip
}
