resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "adminuser"
  password             = "Admin12345"
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  publicly_accessible  = false
  multi_az             = false
  skip_final_snapshot  = true
}
