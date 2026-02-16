S3 Static Website Hosting with Terraform

This project provisions an AWS S3 bucket configured for static website hosting using Terraform.

It creates:

An S3 bucket

Static website configuration

Public access permissions

An uploaded index.html

Outputs the public website URL

📍 Region

The infrastructure is deployed in:

eu-west-1


(You can change this in the provider block.)

🏗 Architecture Overview

Terraform provisions:

S3 Bucket

Static website configuration

Public access configuration

Bucket policy for public read access

Uploads index.html

Outputs website endpoint

📂 Terraform Resources Explained
1️⃣ Provider Configuration
provider "aws" {
  region = "eu-west-1"
}


Specifies the AWS region where resources will be created.

2️⃣ S3 Bucket
resource "aws_s3_bucket" "static_site"


Creates an S3 bucket named:

rbdevi-2026


⚠ Bucket names must be globally unique across AWS.

3️⃣ Static Website Configuration
resource "aws_s3_bucket_website_configuration" "site_config"


Enables static website hosting and sets:

index.html as the default page

This allows the bucket to serve web content.

4️⃣ Public Access Block Configuration
resource "aws_s3_bucket_public_access_block" "public_access"


Disables S3’s public access restrictions by setting:

block_public_acls = false

block_public_policy = false

ignore_public_acls = false

restrict_public_buckets = false

This is required to make the bucket publicly accessible.

5️⃣ Bucket Policy
resource "aws_s3_bucket_policy" "allow_public_access"


Adds a policy that allows:

s3:GetObject

For all users (Principal = "*")

On all objects inside the bucket (/*)

This makes the website publicly readable.

6️⃣ Upload Website File
resource "aws_s3_object" "index"


Uploads a local file:

index.html


With content type:

text/html


This becomes the homepage of the site.

7️⃣ Output
output "website_url"


After terraform apply, Terraform outputs:

website_url


This is the public URL of your static website.

🚀 How to Deploy

Initialize Terraform:

terraform init


Preview changes:

terraform plan


Apply infrastructure:

terraform apply


Copy the website_url output and open it in your browser.

🔐 Security Note

This configuration intentionally makes the S3 bucket public for static website hosting.

This is suitable for:

Portfolio sites

Static documentation

Demo projects

For production environments, consider:

Using CloudFront

Enabling HTTPS

Restricting public access with Origin Access Control (OAC)

🧹 Cleanup

To destroy the infrastructure:

terraform destroy

📘 What You Learn from This Project

How to create an S3 bucket with Terraform

How static website hosting works in S3

How public access policies work

How to upload objects via Terraform

How outputs expose infrastructure information
