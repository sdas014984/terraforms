resource "aws_organizations_organizational_unit" "shared" {
  name      = "SharedServices"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "nonprod" {
  name      = "NonProd"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod"
  parent_id = aws_organizations_organization.org.roots[0].id
}
