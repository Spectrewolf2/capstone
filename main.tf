# Create an Amazon Web Services instance
resource "aws_instance" "aws_instance" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.large"
  key_name      = "great"  # Set the key pair name

  root_block_device {
    volume_size = 25  # Set the size of the root volume to 25GB
  }
  
 user_data = <<-EOF
sudo apt update
sudo apt install git -y
sudo apt install docker-compose -y
sudo apt install ansible -y
sudo snap install terraform --classic
sudo snap install kubectl --classic
sudo snap install aws-cli --classic

  EOF
}


# Define security group for SSH inbound and all outbound traffic
resource "aws_security_group" "ssh_and_all_outbound" {
  name        = "SSHAndAllOutbound"
  description = "Allow SSH inbound and all outbound traffic"

  # Inbound rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule for all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
data "aws_instances" "aws_instances" {
  filter {
    name   = "image-id"
    values = ["ami-080e1f13689e07408"]
  }
}

resource "aws_s3_bucket" "garcia-bucket112" {
  bucket = "garcia-bucket112"

  tags = {
    Name        = "garciabucket112"
    Environment = "Dev"
  }
}