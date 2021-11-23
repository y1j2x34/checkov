def isarn(target):
    # any of these are valid
    if target[0].startswith(('arn', 'aws_kms_key', 'module')):
        return True
    return False
