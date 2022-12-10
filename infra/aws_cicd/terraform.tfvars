environment_use = true

ec2_jenkins_name          = "jenkins"
ec2_jenkins_instance_type = "t3.medium"
ec2_jenkins_ami           = "ami-06eea3cd85e2db8ce"

iam_user_jenkins_name = "jenkins"

iam_user_jenkins_create_iam_access_key = false
iam_user_jenkins_create_login_profile  = true

iam_group_jenkins_name         = "cicd-group"
iam_group_jenkins_create_group = true

jenkins_deploy_policy_name        = "JenkinsDeployPolicy"
jenkins_deploy_policy_path        = "/"
jenkins_deploy_policy_description = "Allow s3 and ECR push"

route53_record_type = "A"
route53_record_ttl  = 300