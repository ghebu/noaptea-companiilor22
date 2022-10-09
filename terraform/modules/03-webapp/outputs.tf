output "vpc" {
    value = data.terraform_remote_state.network.outputs.vpc_id
}