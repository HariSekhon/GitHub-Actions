# GitHub Actions - Reusable Workflows Library

GitHub Actions reusable workflows library to be reused between GitHub repos.

See [Documentation](https://docs.github.com/en/actions/using-workflows/reusing-workflows#calling-a-reusable-workflow) for how to call these workflows directly from your own GitHub Actions workflow.


### Examples

#### Run tfsec on your Terraform repo

Create `.github/workflows/tfsec.yaml` in your repo:
```yaml
on: [push]
jobs:
  tfsec:
    uses: HariSekhon/Gi/tHub-Actions/.github/workflows/tfsec.yaml@master
```

#### Docker Build and push to AWS ECR

Create a GitHub Actions workflow file `.github/workflows/docker.yaml` in your repo:
```yaml
on: [push]
jobs:
  docker_build:
    uses: HariSekhon/GitHub-Actions/.github/workflows/docker_build_aws_ecr.yaml@master
    with:
      repo: MY_ECR_REPO  # without the 'xxx.dkr.ecr.<region>.amazonaws.com' prefix
    secrets:
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      AWS_DEFAULT_REGION: ${{ secrets.AWS_DEFAULT_REGION }}
```
This auto-adds tags:
- `latest`
- Git branch or tag
- Git SHA
- Epoch in seconds
- Date
- Date & Timestamp

Makes heavy use of all several possible caches including branch/tag specific caches to speed up builds / re-builds.

Supports multi-stage build caching using GHCR for intermediate layer caching since AWS ECR doesn't support this at time of writing, simply by adding:

```yaml
    with:
      max-cache: true
```
