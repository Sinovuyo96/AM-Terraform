module "iam_role" {
  source             = "../../Infrastructure/Modules/iam_role"
  role_name          = "Demo_role"
  policy_name        = "Demo_role_policy"
  policy             = file("ec2-policy.json")
  assume_role_policy = file("ec2-Assume-policy.json")
}

