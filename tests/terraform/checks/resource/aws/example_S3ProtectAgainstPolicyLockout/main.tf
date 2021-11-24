
resource "aws_s3_bucket" "fail" {
  bucket = "bucket"

  policy = <<POLICY
        {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Principal": {
                "AWS": [
                "*"
                ]
            },
            "Effect": "Deny",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "*"
            ]
            }
        ]
        }
        POLICY
}


resource "aws_s3_bucket_policy" "fail" {
  bucket = "bucket"

  policy = <<POLICY
        {
            "Version": "2012-10-17",
            "Statement": [{
                "Principal": {
                    "AWS": [
                        "*"
                    ]
                },
                "Effect": "Deny",
                "Action": "s3:*",
                "Resource": [
                    "*"
                ]
            }]
        }
        POLICY
}


resource "aws_s3_bucket" "fail2" {
  bucket = "bucket"

  policy = <<POLICY
        {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Principal": "*",
            "Effect": "Deny",
            "Action": "s3:*"
            }
        ]
        }
        POLICY
}



resource "aws_s3_bucket_policy" "ignore" {
  bucket = "bucket"

  policy = <<POLICY
        {
            "Id": "Policy1597273448050",
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "Stmt1597273446725",
                    "Action": [
                        "s3:GetObject"
                    ],
                    "Resource": "arn:aws:s3:::bucket/*",
                    "Principal": {
                        "AWS": "some_arn"
                    }
                }
            ]
        }
        POLICY
}


resource "aws_s3_bucket_policy" "ignore2" {
  bucket = "bucket"

  policy = <<POLICY
        {
            "Id": "Policy1597273448050",
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "Stmt1597273446725",
                    "NotAction": [
                        "s3:GetObject"
                    ],
                    "Effect": "Deny",
                    "Resource": "arn:aws:s3:::bucket/*",
                    "Principal": {
                        "AWS": "some_arn"
                    }
                }
            ]
        }
        POLICY
}


resource "aws_s3_bucket_policy" "pass" {
  bucket = "bucket"

  policy = <<POLICY
        {
            "Id": "Policy1597273448050",
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "Stmt1597273446725",
                    "Action": [
                        "s3:GetObject"
                    ],
                    "Effect": "Deny",
                    "Resource": "arn:aws:s3:::bucket/*",
                    "Principal": {
                        "AWS": "some_arn"
                    }
                }
            ]
        }
        POLICY
}


resource "aws_s3_bucket_policy" "pass2" {
  bucket = "bucket"

  policy = <<POLICY
        {
            "Id": "Policy1597273448050",
            "Version": "2012-10-17",
            "Statement": {
                    "Sid": "Stmt1597273446725",
                    "Action": [
                        "s3:GetObject"
                    ],
                    "Effect": "Deny",
                    "Resource": "arn:aws:s3:::bucket/*",
                    "Principal": {
                        "AWS": "some_arn"
                    }
                }
        }
        POLICY
}

