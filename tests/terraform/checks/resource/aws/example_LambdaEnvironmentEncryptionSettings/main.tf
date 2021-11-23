resource "aws_lambda_function" "fail" {
   function_name                  = var.function_name
   role                           = aws_iam_role.lambda-messageprocessor.arn
   runtime                        = "python3.6"
   handler                        = "handler.lambda_handler"
   filename                       = data.archive_file.notify.output_path
   source_code_hash               = data.archive_file.notify.output_base64sha256
   reserved_concurrent_executions = var.concurrency
   tracing_config {
       mode = "PassThrough"
    }
    environment {
        test="true"
    }
}

resource "aws_lambda_function" "failkmsnovars" {
   function_name                  = var.function_name
   role                           = aws_iam_role.lambda-messageprocessor.arn
   runtime                        = "python3.6"
   handler                        = "handler.lambda_handler"
   filename                       = data.archive_file.notify.output_path
   source_code_hash               = data.archive_file.notify.output_base64sha256
   reserved_concurrent_executions = var.concurrency
   tracing_config {
       mode = "PassThrough"
    }
   kms_key_arn = aws_kms_key.anyoldguff.arn
}

resource "aws_lambda_function" "ignore" {
   function_name                  = var.function_name
   role                           = aws_iam_role.lambda-messageprocessor.arn
   runtime                        = "python3.6"
   handler                        = "handler.lambda_handler"
   filename                       = data.archive_file.notify.output_path
   source_code_hash               = data.archive_file.notify.output_base64sha256
   reserved_concurrent_executions = var.concurrency
   tracing_config {
       mode = "PassThrough"
    }
}

resource "aws_lambda_function" "pass" {
   function_name                  = var.function_name
   role                           = aws_iam_role.lambda-messageprocessor.arn
   runtime                        = "python3.6"
   handler                        = "handler.lambda_handler"
   filename                       = data.archive_file.notify.output_path
   source_code_hash               = data.archive_file.notify.output_base64sha256
   reserved_concurrent_executions = var.concurrency
   tracing_config {
       mode = "PassThrough"
    }
    environment {
        test="true"
    }
   kms_key_arn = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
}

resource "aws_lambda_function" "passresource" {
   function_name                  = var.function_name
   role                           = aws_iam_role.lambda-messageprocessor.arn
   runtime                        = "python3.6"
   handler                        = "handler.lambda_handler"
   filename                       = data.archive_file.notify.output_path
   source_code_hash               = data.archive_file.notify.output_base64sha256
   reserved_concurrent_executions = var.concurrency
   tracing_config {
       mode = "PassThrough"
    }
    environment {
        test="true"
    }
   kms_key_arn = aws_kms_key.mykey.arn
}

resource "aws_lambda_function" "failasempty" {
   function_name                  = var.function_name
   role                           = aws_iam_role.lambda-messageprocessor.arn
   runtime                        = "python3.6"
   handler                        = "handler.lambda_handler"
   filename                       = data.archive_file.notify.output_path
   source_code_hash               = data.archive_file.notify.output_base64sha256
   reserved_concurrent_executions = var.concurrency
   tracing_config {
       mode = "PassThrough"
    }
   kms_key_arn = ""
}

resource "aws_lambda_function" "modulepass" {
   function_name                  = var.function_name
   role                           = aws_iam_role.lambda-messageprocessor.arn
   runtime                        = "python3.6"
   handler                        = "handler.lambda_handler"
   filename                       = data.archive_file.notify.output_path
   source_code_hash               = data.archive_file.notify.output_base64sha256
   reserved_concurrent_executions = var.concurrency

   tracing_config {
       mode = "PassThrough"
    }

    environment {
        test="true"
    }

   kms_key_arn = module.anyoldguff.aws_kms_key.arn
}

