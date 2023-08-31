# locals {
#   instances_subnets = merge(
#     {
#       for instance, config in var.instances : instance => module.networking.public_subnets if config.network_mode == "public"
#     },
#     {
#       for instance, config in var.instances : instance => module.networking.private_subnets if config.network_mode == "private"
#     }
#   )
# }
