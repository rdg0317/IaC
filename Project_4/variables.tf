variable "iam_user_name" {
  description = "The name of the IAM user"
  type        = string
  default     = "s3-reader-user"
}
variable "s3_read_policy_json" {
  description = "JSON policy for S3 read-only access"
  type        = string
  default     = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}