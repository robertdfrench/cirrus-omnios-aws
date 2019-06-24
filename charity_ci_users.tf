resource "aws_iam_group_policy" "charity_ci_users" {
  name   = "charity_ci_users"
  group  = aws_iam_group.charity_ci_users.id
  policy = data.local_file.charity_ci_users.content
}

data "local_file" "charity_ci_users" {
  filename = "./charity_ci_users_policy.json"
}

resource "aws_iam_group" "charity_ci_users" {
  name = "charity_ci_users"
  path = "/external/"
}

# github/robertdfrench
resource "aws_iam_user" "robertdfrench" {
  name = "robertdfrench"
  path = "/external/github.com/"
}

resource "aws_iam_user_group_membership" "robertdfrench" {
  user   = aws_iam_user.robertdfrench.name
  groups = [aws_iam_group.charity_ci_users.name]
}
