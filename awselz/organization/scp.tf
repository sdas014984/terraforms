resource "aws_organizations_policy" "deny_public_ec2" {
  name = "deny-public-ec2"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Deny"
      Action = [
        "ec2:AssociateAddress",
        "ec2:RunInstances"
      ]
      Resource = "*"
      Condition = {
        StringEquals = {
          "ec2:AssociatePublicIpAddress" = "true"
        }
      }
    }]
  })
}

resource "aws_organizations_policy_attachment" "prod_attach" {
  policy_id = aws_organizations_policy.deny_public_ec2.id
  target_id = aws_organizations_organizational_unit.prod.id
}
