resource "aws_db_instance" "cmk_mydb" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "${var.prot_mysql}"
  engine_version          = "8.0"
  instance_class          = "db.${var.instance}"
  name                    = "mydb"
  identifier              = "mydb"
  username                = "admin"
  password                = "It12345!"
  parameter_group_name    = "default.mysql8.0"
  availability_zone       = "${var.region}${var.avazone[0]}"
  db_subnet_group_name    = aws_db_subnet_group.cmk_dbsn.id
  vpc_security_group_ids  = [aws_security_group.cmk_websg.id]
  skip_final_snapshot     = true
  tags = {
      Name = "cmk-mydb"
  }
}

resource "aws_db_subnet_group" "cmk_dbsn" {
  name  =   "cmk-dbsb-group"
  subnet_ids = [aws_subnet.cmk_pridb[0].id,aws_subnet.cmk_pridb[1].id]
  tags = {
      Name = "cmk-dbsb-group"
  }
}