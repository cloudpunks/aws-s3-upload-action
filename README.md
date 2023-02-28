# aws-s3-upload-action
uses aws-cli to upload assets to a s3-bucket inside aws

## variables
this action uses the following inputs (all are required):
| Variable       | Required | Default | Description                                                                              |
|----------------|----------|---------|------------------------------------------------------------------------------------------|
| aws_access_key | yes      |         | access-key to AWS                                                                        |
| aws_secret_key | yes      |         | secret-key to AWS                                                                        |
| aws_region     | yes      |         | AWS Region                                                                               |
| aws_bucket     | yes      |         | AWS Bucket                                                                               |
| copy_method    | no       | sync    | copy method. Can be 'copy' or 'sync'. Copy = normal copy, sync behaves like rsync        |
| copy_delete    | no       | no      | delete files not in your repository? only for method=sync. behaves like `rsync --delete` |
| source         | yes      |         | source directory or file inside your repository                                          |
| destionation   | no       |         | destination directory inside your bucket                                                 |

## example usage
```yaml
- uses: cloudpunks/aws-s3-upload-action@v0.0.2
  with:
    aws_access_key: ${{ secrets.AWS_ACCESS_KEY }}
    aws_secret_key: ${{ secrets.AWS_SECRET_KEY }}
    aws_region: 'eu-central-1'
    aws_bucket: ${{ var.AWS_BUCKET }}
    copy_method: sync
    copy_delete: yes
    source: assets/
```
