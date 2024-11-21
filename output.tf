locals {
  worker_node_list = join("\n", [for instance in aws_instance.worker_node : "ubuntu@${instance.public_ip}"])
}

output "instance_ids" {
  value = format("[Master]\nubuntu@%s ansible_user=ubuntu\n\n\n[Worker]\n%s", 
                  aws_instance.master_node.public_ip, 
                  local.worker_node_list)
}
