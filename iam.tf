resource "aws_iam_group" "charity_ci_users" {
	name = "charity_ci_users"
	path = "/external/"
}
