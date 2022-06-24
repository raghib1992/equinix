# resource "tls_private_key" "demo_tls" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "demo_key" {
#   key_name   = "deployer-key"
#   public_key = tls_private_key.demo_tls.public_key_openssh
# }

output "key" {
    value = data.aws_key_pair.demo_key
}

data "aws_key_pair" "demo_key" {
  key_name = "sankanlan-keypair"
  # filter {
  #   name   = "tag:Component"
  #   values = ["web"]
  # }
}