data "aws_ami" "amazon_linux_2_x86" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_launch_template" "web" {
  name_prefix   = "web-template"
  image_id      = "ami-0c44f651ab5e9285f"
  instance_type = "t3.micro"

  user_data = base64encode(<<EOF
#!/bin/bash
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Apache Web Server</h1>" > /var/www/html/index.html
EOF
  )

  vpc_security_group_ids = [aws_security_group.web_sg.id]
}

resource "aws_autoscaling_group" "web_asg" {
  min_size            = 2
  max_size            = 2
  desired_capacity    = 2
  vpc_zone_identifier = aws_subnet.public[*].id

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns         = [aws_lb_target_group.tg.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300
}
