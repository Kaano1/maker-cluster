output "instance_ids" {
  value = format("ubuntu@%s ansible_user=ubuntu", aws_instance.master_node.public_ip)
}
