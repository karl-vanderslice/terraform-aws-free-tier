# main.tf

# don't care about any
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
