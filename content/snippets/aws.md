---
date: 2019-11-09T01:01:26Z
lang: en
tags: [ aws, info, tips, tricks, how to ]
title: AWS
summary: Small information nuggets and recipies about AWS
showToc: true
tocOpen: true
---

*(most recent on top)*

## Create KMS security info with CloudFormation

* [AWS::KMS::Alias - AWS CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-kms-alias.html)
* [AWS::KMS::Key - AWS CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-kms-key.html)

```yaml
Resources:
  EncryptionKeyAlias:
    Type: AWS::KMS::Alias
    Properties:
      AliasName: alias/my-aws-kms-encryption-key
      TargetKeyId:
        Ref: EncryptionKey
  EncryptionKey:
    Type: AWS::KMS::Key
    Properties:
      Description: My AWS KMS Encryption Key
      KeyPolicy:
        Version: "2012-10-17"
        Id: my-aws-kms-encryption-key
        Statement:
          - Sid: "Enable IAM User Permissions"
            Effect: "Allow"
            Principal:
              - AWS: "arn:aws:iam::123456789012:root"
            Action: "kms:*"
            Resource: "*"
          - Sid: "Allow access for Key Administrators"
            Effect: "Allow"
            Principal:
              AWS:
                - "arn:aws:iam::123456789012:user/alice"
                - "arn:aws:iam::123456789012:user/bob"
            Action:
              - "kms:Create*"
              - "kms:Describe*"
              - "kms:Enable*"
              - "kms:List*"
              - "kms:Put*"
              - "kms:Update*"
              - "kms:Revoke*"
              - "kms:Disable*"
              - "kms:Get*"
              - "kms:Delete*"
              - "kms:TagResource"
              - "kms:UntagResource"
              - "kms:ScheduleKeyDeletion"
              - "kms:CancelKeyDeletion"
            Resource: "*"
          - Sid: "Allow use of the key"
            Effect: "Allow"
            Principal:
              - AWS:
                  "Fn::GetAtt": [ IamRoleLambdaExecution, Arn ]
            Action:
              - "kms:Encrypt"
              - "kms:Decrypt"
              - "kms:ReEncrypt*"
              - "kms:GenerateDataKey*"
              - "kms:DescribeKey"
            Resource: "*"
          - Sid: "Allow attachment of persistent resources"
            Effect: "Allow"
            Principal:
              AWS:
                "Fn::GetAtt": [ IamRoleLambdaExecution, Arn ]
            Action:
              - "kms:CreateGrant"
              - "kms:ListGrants"
              - "kms:RevokeGrant"
            Resource: "*"
            Condition:
              Bool:
                "kms:GrantIsForAWSResource": true
```

## Helpers to `encrypt`/`decrypt` via AWS KMS

*… decrypt contents of a file*

```bash
decrypt () {
  local file_name="$1"
  aws kms decrypt --ciphertext-blob fileb://$file_name --query Plaintext --output text | base64 --decode
}
```

*… encrypt contents of text data*

```bash
encrypt () {
  local key_name="$1"
  local data="$2"
  aws kms encrypt --key-id alias/$key_name --plaintext "$data" --query CiphertextBlob --output text | base64 --encode
}
```

## Allow url parameters on `aws ssm`

* [aws ssm put-parameter performs an HTTP GET request when the value param is an url · Issue #2507 · aws/aws-cli](https://github.com/aws/aws-cli/issues/2507) *(via [Adam Hansrod](https://equalexperts.slack.com/archives/C0KU4SA5N/p1550249921001800))*

```bash
$ cat ~/.aws/config
[default]
cli_follow_urlparam = false
```
