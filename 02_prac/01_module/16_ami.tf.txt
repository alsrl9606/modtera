resource "aws_ami_from_instance" "cmk_ami" {
  name                    = "cmk-ami"
  source_instance_id      = aws_instance.cmk_weba.id
  depends_on = [
    aws_instance.cmk_weba
  ]
}