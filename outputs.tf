output "aws_instance_status" {
  value = {
    instance_state     = aws_instance.aws_instance.instance_state
    instance_id  = aws_instance.aws_instance.id
    instance_type = aws_instance.aws_instance.instance_type
    public_ip     = aws_instance.aws_instance.public_ip
    private_ip    = aws_instance.aws_instance.private_ip
    # Add any other attributes you want to display
  }
}

output "aws_internal_ip" {
  value = aws_instance.aws_instance.private_ip
}


output "aws_public_ip" {
  value = aws_instance.aws_instance.public_ip
}