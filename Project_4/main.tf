#provider

provider "aws" {
region="eu-west-1"
}

resource "aws_iam_user" "automated_user" {
  name = var.iam_user_name
}
resource "aws_iam_policy" "s3_read_only" {
  name        = "iam-s3-read-policy"
  description = "Policy for reading S3 buckets"
  policy      = var.s3_read_policy_json
}
resource "aws_iam_user_policy_attachment" "attach_read" {
  user       = aws_iam_user.automated_user.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}

#output
 
output "user_arn" {
  value = aws_iam_user.automated_user.arn
}
