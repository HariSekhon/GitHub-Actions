# GitHub Actions - Reusable Workflows Library

GitHub Actions reusable workflows library to be reused between GitHub repos.

See [Documentation](https://docs.github.com/en/actions/using-workflows/reusing-workflows#calling-a-reusable-workflow) for how to call these workflows directly from your own GitHub Actions workflow.

## Examples

In your GitHub repo, import these workflows by adding small yaml files to the `.github/workflows/` directory.

### Scan for Secrets and Security issues

Alerts appear under Security -> Code scanning alerts.

Create `.github/workflows/semgrep.yaml`:
```yaml
on: [push]
jobs:
  semgrep:
    uses: HariSekhon/GitHub-Actions/.github/workflows/semgrep.yaml@master
```

### Analyze your Terraform code security & best practices

Create `.github/workflows/tfsec.yaml`:
```yaml
on: [push]
jobs:
  tfsec:
    uses: HariSekhon/Gi/tHub-Actions/.github/workflows/tfsec.yaml@master
```

### Docker Build and push to AWS ECR

Create `.github/workflows/docker.yaml`:
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

### Check for Broken Links

Create `.github/workflows/url_links.yaml`:
```yaml
on: [push]
jobs:
  url_links:
    uses: HariSekhon/GitHub-Actions/.github/workflows/url_links.yaml@master
    with:
      url_links_ignored: |
        # ignore inaccessible / internal / partially constructed links or those containing variables
        https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv
```
