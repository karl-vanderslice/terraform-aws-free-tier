locals {
  current_public_ip = jsondecode(data.http.current_public_ip.response_body)
  ami_id            = var.instance_ami != null ? var.instance_ami : data.aws_ami.al.id
}

#tfsec:ignore:aws-ec2-enforce-http-token-imds tfsec:ignore:aws-ec2-enable-at-rest-encryption tfsec:ignore:aws-ec2-enable-at-rest-encryption
resource "aws_instance" "ec2" {
  # TODO: Clean all this up
  #ts:skip=AC-AWS-NS-IN-M-1172
  #ts:skip=AWS.AI.LM.HIGH.0070
  #checkov:skip=CKV_AWS_88
  #checkov:skip=CKV_AWS_8
  #checkov:skip=CKV_AWS_135
  #checkov:skip=CKV_AWS_79
  #checkov:skip=CKV_AWS_126
  #checkov:skip=CKV2_AWS_41
  count = var.instance_count

  ami = local.ami_id

  instance_type = var.instance_type

  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.sg.id]

  associate_public_ip_address = true

  key_name = aws_key_pair.key_pair.key_name

  tags = merge(
    { "Name" = var.name },
    var.tags
  )

}

resource "aws_security_group" "sg" {
  #ts:skip=AC_AWS_0319
  name        = "${var.name}-sg"
  description = "For ${var.name} EC2 instance."

  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${local.current_public_ip.ip}/32"]
    description = "Incoming SSH, limited to calling workstation public IP."
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-egress-sgr
    description = "Outgoing internet connectivity."
  }

  tags = merge(
    { "Name" = "${var.name}-sg" },
    var.tags
  )
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.name
  public_key = file(var.public_key_pair_path)
}
