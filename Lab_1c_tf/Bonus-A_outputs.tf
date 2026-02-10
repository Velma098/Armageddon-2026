#Bonus-A outputs (append to outputs.tf)

# Explanation: These outputs prove dawgs_armageddon built private hyperspace lanes (endpoints) instead of public chaos.
output "dawgs_armageddon_vpce_ssm_id" {
  value = aws_vpc_endpoint.dawgs_armageddon_vpce_ssm01.id
}

output "dawgs_armageddon_vpce_logs_id" {
  value = aws_vpc_endpoint.dawgs_armageddon_vpce_logs01.id
}

output "dawgs_armageddon_vpce_secrets_id" {
  value = aws_vpc_endpoint.dawgs_armageddon_vpce_secrets01.id
}

output "dawgs_armageddon_vpce_s3_id" {
  value = aws_vpc_endpoint.dawgs_armageddon_vpce_s3_gw01.id
}

output "dawgs_armageddon_private_ec2_instance_id_bonus" {
  value = aws_instance.dawgs_armageddon_ec201_private_bonus.id
}


