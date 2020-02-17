output "project_url" {
  value       = aws_instance.server.private_ip
  description = "The URL to the project on Google Console"
}
