# Create the bucket
aws s3api create-bucket \
  --bucket zen-pharma-terraform-state-ruzzel6 \
  --region us-east-1

# Enable versioning (allows state rollback)
aws s3api put-bucket-versioning \
  --bucket zen-pharma-terraform-state-ruzzel6 \
  --versioning-configuration Status=Enabled

# Enable encryption
aws s3api put-bucket-encryption \
  --bucket zen-pharma-terraform-state-ruzzel6 \
  --server-side-encryption-configuration '{
    "Rules": [{
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }]
  }'

# Block all public access
aws s3api put-public-access-block \
  --bucket zen-pharma-terraform-state-ruzzel6 \
  --public-access-block-configuration \
    "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
