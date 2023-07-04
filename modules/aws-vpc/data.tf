data "aws_availability_zones" "current" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
