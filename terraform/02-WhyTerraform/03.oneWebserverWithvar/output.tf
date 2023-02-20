output "public_ip" {
  value = aws_nstance.example.public_ip
  description = "The public IP address of the web server"
}
