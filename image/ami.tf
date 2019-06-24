data "aws_ami" "omnios" {
  most_recent = true
  name_regex  = "cirrus-omnios"
  owners      = ["self"]
}

output "ami" {
  value = data.aws_ami.omnios.id
}
