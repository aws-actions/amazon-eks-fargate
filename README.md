## WIP: Amazon EKS on AWS Fargate GitHub Actions

This action allows to manage the lifecycle of an [Amazon EKS](https://aws.amazon.com/eks/) cluster running on [AWS Fargate](https://aws.amazon.com/fargate/).

NOTE: this is work in progress, not yet usable.

## Usage

In a GH Action file, for example, `.github/workflows/main.yaml`:

```
on: [push]

jobs:
  create_cluster:
    runs-on: ubuntu-latest
    name: Create an EKS on Fargate cluster
    steps:
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: eu-west-1
    - name: Provision cluster
      uses: aws-actions/amazon-eks-fargate@v0.1
```

## License

This project is licensed under the Apache-2.0 License.

## Security Disclosures

If you would like to report a potential security issue in this project, please do not create a GitHub issue.  Instead, please follow the instructions [here](https://aws.amazon.com/security/vulnerability-reporting/) or [email AWS security directly](mailto:aws-security@amazon.com).
