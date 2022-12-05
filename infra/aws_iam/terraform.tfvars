iam_user = {
  Administrator = [
    "ldy9037"
  ],
}

iam_user_create_iam_access_key = false
iam_user_create_login_profile  = true

iam_group_with_policy = {
  Administrator = {
    create_group             = true
    custom_group_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  }
}