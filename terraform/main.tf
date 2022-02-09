resource "aws_instance" "ec2_instance" {
    ami = "ami-01cc34ab2709337aa"
    instance_type = "t2.micro"
    vpc_security_group_ids = [var.SG]
    tags = {Name = "HTTP_SERVER"}
    key_name = "devops"
    count = 1

provisioner "remote-exec" {
   inline = ["sudo yum install httpd -y", "sudo service httpd start", "sudo chmod 777 /var/www/html/"]
}

provisioner "file" {
 source = "mywebsite.html"
 destination = "/var/www/html/mywebsite.html"
}

connection {
  host = self.public_ip
  user = "ec2-user"
  private_key = file("/home/ubuntu/jenkins_project/standard-build/Terraform/devops.pem")
  }
}
