
resource "aws_iam_instance_profile" "test_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = var.instance_profile_name
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

data "aws_iam_policy" "instance_core" {
  name = "AmazonSSMManagedInstanceCore"
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "InstanceCore"
  roles      = [aws_iam_role.role.name]
  policy_arn = data.aws_iam_policy.instance_core.arn
}