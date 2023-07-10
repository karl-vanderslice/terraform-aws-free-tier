# main.tf

resource "random_pet" "nickname" {
  length = 1
}

module "labels" {
  source      = "./modules/aws-labels"
  enabled     = true
  name        = random_pet.nickname.id
  environment = "dev"
}

module "network" {
  source = "./modules/aws-network"
  name   = module.labels.id
  tags   = module.labels.tags
}

#tfsec:ignore:aws-ec2-no-public-egress-sgr tfsec:ignore:aws-ec2-enforce-http-token-imds tfsec:ignore:aws-ec2-enable-at-rest-encryption
module "ec2" {
  #checkov:skip=CKV_AWS_88
  #checkov:skip=CKV_AWS_8
  #checkov:skip=CKV_AWS_135
  #checkov:skip=CKV_AWS_79
  #checkov:skip=CKV_AWS_126
  #checkov:skip=CKV2_AWS_41
  source = "./modules/aws-ec2"
  name   = module.labels.id
  tags   = module.labels.tags

  public_subnet_id = module.network.public_subnet_id
  vpc_id           = module.network.vpc_id

  public_key_pair_path = var.public_key_pair_path

}
