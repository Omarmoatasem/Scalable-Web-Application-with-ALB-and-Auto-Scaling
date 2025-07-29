
output "frontend_public_ip" {
  value = module.frontend.public_ip
}

output "backend_private_ip" {
  value = module.backend.private_ip
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}
