output sandbox-network {
  value = module.vpc.network_self_link
}

output sandbox-subnet-west3 {
  value = module.vpc.subnets["us-west3/${var.username}-sandbox-subnet-west3"].self_link
}

output sandbox-subnet-west3-cidr {
  value = module.vpc.subnets["us-west3/${var.username}-sandbox-subnet-west3"].ip_cidr_range
}

output sandbox-subnet-central1 {
  value = module.vpc.subnets["us-central1/${var.username}-sandbox-subnet-central1"].self_link
}

output sandbox-subnet-central1-cidr {
  value = module.vpc.subnets["us-central1/${var.username}-sandbox-subnet-central1"].ip_cidr_range
}

output sandbox-subnet-east4 {
  value = module.vpc.subnets["us-east4/${var.username}-sandbox-subnet-east4"].self_link
}

output sandbox-subnet-east4-cidr {
  value = module.vpc.subnets["us-east4/${var.username}-sandbox-subnet-east4"].ip_cidr_range
}
