module "compute-dev" {
  source                 = "./modules/compute/dev"
}

module "compute-prd" {
  source                 = "./modules/compute/prd"
}

module "compute-tst" {
  source                 = "./modules/compute/tst"
}


