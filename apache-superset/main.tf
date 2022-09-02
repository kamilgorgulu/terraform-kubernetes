provider "kubernetes" {
  config_path = "./kube_configs/kube_config.yml"
  insecure = true
}


module "namespace" {
    source = "./namespace"
}

module "config_map" {

    source = "./config_map"
}

module "deployment" {
    source = "./deployment"
}

module "service" {
    source = "./service"
}



