resource "aws_iam_role" "ec2" {
  name = "ec2-docker"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
# instance profile for AWS ec2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-docker-profile"
  role = aws_iam_role.ec2.name
}


resource "aws_iam_role_policy_attachment" "bastion" {
  role = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
}