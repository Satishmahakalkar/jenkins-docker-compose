resource "aws_instance" "jenkins" {
  ami           = "ami-04b4f1a9cf54c11d0"  # Ubuntu AMI ID
  instance_type = "t2.micro"
  key_name      = "serverless-key"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y docker docker-compose git
    systemctl enable docker
    systemctl start docker
    git clone https://github.com/Satishmahakalkar/jenkins-docker-compose.git /opt/jenkins
    cd /opt/jenkins
    docker-compose up -d
  EOF

  tags = { Name = "Jenkins-Server" }
}

