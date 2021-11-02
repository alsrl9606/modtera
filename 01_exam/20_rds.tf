resource "aws_db_instance" "cmk_mydb" {
    allocated_storage = 10
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.micro"
    name = "mydb"
    identifier = "mydb"
    username = "admin"
    password = "It12345!"
    parameter_group_name = "default.mysql5.7"
    availability_zone = "ap-northeast-2a"
    db_subnet_group_name = aws_db_subnet_group.cmk_dbsn.id
    skip_final_snapshot = true
    tags = {
      name = "cmk-mydb"
    }

}

resource "aws_db_subnet_group" "cmk_dbsn" {
    name = "cmk-db-group"
    subnet_ids = [aws_subnet.cmk_pridba.id, aws_subnet.cmk_pridbc.id]
    tags = {
      Name = "cmk-dbsb-group"
    }
  
}