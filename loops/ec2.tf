resource "aws_instance" "roboshop" {
  count = 4
  ami           = "ami-0220d79f3f480ecf5" #if we are using variables then describe this as ami=var.ami_id
  instance_type = var.environment == "dev" ? "t3.micro" : "t2.small"
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]

  tags = {
    Name = var.instance[count.index] 
  }
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"


ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # cidr_blocks=var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # cidr_blocks=var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }


tags = {
    Name = "allow_tls"
  }
}