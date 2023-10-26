#User_cration

provider "aws" {
  region = "us-east-2" 
}

resource "aws_iam_user" "my_user" {
  name = "itc"
}

#Define_Policy

resource "aws_iam_policy" "my_policy" {
  name        = "applypolicy_itc"
  description = "for itc6345"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#attach policy to iam User
resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = "itc" 
  policy_arn = "arn:aws:iam::052405306673:policy/applypolicy_itc"
}

