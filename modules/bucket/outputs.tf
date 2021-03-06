# In order to pass out the bucket ID we must combine the results of both bucket resources, and extract the 0th element

output "bucket_id" {
  value = "${element(
                      concat(
                        compact(
                                concat(
                                        aws_s3_bucket.bucket_with_www.*.id,
                                        aws_s3_bucket.bucket_without_www.*.id
                                )
                        ),
                        list("")
                      ),
                      0)}"

  description = "ID for Origin S3 Bucket"
}

output "bucket_arn" {
  value = "${element(
                      concat(
                        compact(
                                concat(
                                        aws_s3_bucket.bucket_with_www.*.arn,
                                        aws_s3_bucket.bucket_without_www.*.arn
                                )
                        ),
                        list("")
                      ),
                      0)}"

  description = "ARN for Origin S3 Bucket"
}

output "bucket_domain_name" {
  value = "${element(
                      concat(
                        compact(
                                concat(
                                        aws_s3_bucket.bucket_with_www.*.bucket_domain_name,
                                        aws_s3_bucket.bucket_without_www.*.bucket_domain_name
                                )
                        ),
                        list("")
                      ),
                      0)}"

  description = "Domain name for Origin S3 Bucket"
}
