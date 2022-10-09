module "webapp" { 
    source = "../../../modules/03-webapp"
    name_prefix = "noaptea-companiilor"
    # sg_ingress_rules = [
    #     {
    #         from_port = 80, to_port = 80, protocol = "tcp"
    #     },
    #     {
    #         from_port = 22, to_port = 22, protocol = "tcp"
    #     }
    # ]
}
