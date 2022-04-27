
resource "aws_iam_role_policy" "test_policy" {
  name = var.policy_name
  role = aws_iam_role.ec2_role.id
  policy = "${var.policy}"
}

resource "aws_iam_role" "ec2_role" {
  name = var.role_name
  assume_role_policy = "${var.assume_role_policy}"

  tags = {
    tag-key = "tag-value"
  }
}
