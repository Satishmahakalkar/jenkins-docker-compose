resource "aws_eip" "jenkins_eip" {
  instance = var.instance_id
}

