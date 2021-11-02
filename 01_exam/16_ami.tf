resource "aws_ami_from_instance" "cmk_ami" {
    name               = "cmk_ami"
    source_instance_id = aws_instance.cmk_weba.id
    
}