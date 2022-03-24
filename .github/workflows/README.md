# GitHub Actions - Reusable Workflows Library

GitHub Actions reusable workflows library to be reused between GitHub repos.

See [Documentation](https://docs.github.com/en/actions/using-workflows/reusing-workflows#calling-a-reusable-workflow) for how to call these workflows directly from your own GitHub Actions workflow.

## Examples

In your GitHub repo, import these workflows by adding small yaml files to the `.github/workflows/` directory.

### Scan for Secrets and Security issues

[![Semgrep](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/semgrep.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/semgrep.yaml)
Alerts appear under Security -> Code scanning alerts.

Create `.github/workflows/semgrep.yaml`:
```yaml
on: [push]
jobs:
  semgrep:
    uses: HariSekhon/GitHub-Actions/.github/workflows/semgrep.yaml@master
```

### Analyze your Terraform code security & best practices

[![tfsec](https://github.com/HariSekhon/Terraform/actions/workflows/tfsec.yaml/badge.svg)](https://github.com/HariSekhon/Terraform/actions/workflows/tfsec.yaml)
Alerts appear under Security -> Code scanning alerts.

Create `.github/workflows/tfsec.yaml`:
```yaml
on: [push]
jobs:
  tfsec:
    uses: HariSekhon/GitHub-Actions/.github/workflows/tfsec.yaml@master
```

### Docker Build and push to DockerHub

[![Docker Build DevOps Bash Tools (Ubuntu)](https://github.com/HariSekhon/Dockerfiles/actions/workflows/docker_build_devops_bash_tools_ubuntu.yaml/badge.svg)](https://github.com/HariSekhon/Dockerfiles/actions/workflows/docker_build_devops_bash_tools_ubuntu.yaml)

Create `.github/workflows/docker_build.yaml`:
```yaml
on: [push]
jobs:
  docker_build:
    uses: HariSekhon/GitHub-Actions/.github/workflows/docker_build.yaml@master
    with:
      repo: harisekhon/bash-tools  # DockerHub user/repo
      tags: latest ubuntu          # builds, tags as harisekhon/bash-tools:latest and harisekhon/bash-tools:ubuntu and pushes to DockerHub
      context: devops-bash-tools-ubuntu  # path to dir containing the source and Dockerfile
      #max-cache: true                   # if you need multi-stage caching (uses a separate cache image)
    secrets:
      DOCKERHUB_USER: ${{ secrets.DOCKERHUB_USER }}
      DOCKERHUB_TOKEN: ${{ secrets.DOCKERHUB_TOKEN }}
```

### Docker Build and push to AWS ECR

Create `.github/workflows/docker_build_aws_ecr.yaml`:
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

Makes heavy use of all several possible caches including branch/tag specific caches to speed up builds / re-builds and avoid cache invalidation between environments.

Supports multi-stage build caching using GHCR for intermediate layer caching since AWS ECR doesn't support this at time of writing, simply by adding:

```yaml
    with:
      max-cache: true
```

### Check for Broken URL Links

[![URL Links](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/url_links.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/url_links.yaml)

Create `.github/workflows/url_links.yaml`:
```yaml
on: [push]
jobs:
  url_links:
    uses: HariSekhon/GitHub-Actions/.github/workflows/url_links.yaml@master
    with:

      # custom ignore inaccessible / internal / partially constructed links or those containing variables
      # this is a multi-line string, one URL or partial ERE regex match per line
      url_links_ignored: |
        https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv

      # ignore URLs without dots as these are usually internal inaccessible local addresses such as http://krb5server rather than public accessible links
      #ignore_urls_without_dots: 'true'  # any value enables this
```

### Auto-Merge Production hotfixes back to Staging

Merges via a Pull Request for full auditing.

Create `.github/workflows/merge_production_to_staging.yaml`:
```yaml
on: [push]
jobs:
  merge:
    if: github.ref_name == 'production'
    name: Merge Production Branch to Staging Branch (hotfix backports)
    uses: HariSekhon/GitHub-Actions/.github/workflows/merge-branch.yaml@master
    with:
      head: production  # from - optional - if omitted defaults to the trigger branch, which is always 'production' due to the if condition above
      base: staging     # to
```

### Mirror Repos to GitLab for DR Backups

Mirrors all/given GitHub repos to GitLab - including all branches and tags, and GitHub repo description

```yaml
on:
  # allow to run manually with one or more repos
  workflow_dispatch:
    inputs:
      repos:
        description: The GitHub repos to mirror to GitLab, space separated (empty defaults to all repos accessible)
        type: string
        default: ""
        required: false

  schedule:
    # mirror to GitLab hourly
    - cron: '0 * * * *'

jobs:
  gitlab_mirror:
    name: GitLab Mirror
    if: github.event.repository.fork == false && github.ref_type == 'branch' && github.ref_name == github.event.repository.default_branch
    uses: HariSekhon/GitHub-Actions/.github/workflows/gitlab-mirror.yaml@master
    with:
      #organization: my-org  # optional: mirror your company's repos instead of your personal repos
      repos: ${{ github.event.inputs.repos }}  # if triggering manually, mirror those given repos, if blank, mirror all of them
    secrets:
      GH_TOKEN: ${{ secrets.GH_TOKEN }}
      GITLAB_TOKEN: ${{ secrets.GITLAB_TOKEN }}
```

## Permissions

These workflows are locked down to the minimal required permissions as per the best practice principal of least privilege, usually just `contents: read`, but some require extra permissions to create Pull Requests or write Security Alerts to the GitHub Security tab.

If you've locked down your GitHub Organizations permissions to default to `contents: read` (which I recommend), then you may want to copy the permissions key out of the workflow to your calling workflow to grant them the needed permissions.

### Security Alerts

```yaml
permissions:
  actions: read
  contents: read
  security-events: write
```
These 3 permissions are needed for workflows that report to GitHub Security tab, including:
- [checkov.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/checkov.yaml)
- [kics.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/kics.yaml)
- [semgrep.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/semgrep.yaml)
- [tfsec.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/tfsec.yaml)
- [trivy_github.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/trivy_github.yaml)

### Linting Auto-fixers

For workflows that lint-and-fix code, such as [terraform-fmt-write.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/terraform-fmt-write.yaml), you'll need to grant:
```yaml
permissions:
  contents: write       # if called by on: push
  pull-requests: write  # if called by on: pull_request
```

### Creating or Commenting on Pull Requests

For workflows that create or comment on PRs, such as [tfsec-pr-commenter.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/tfsec-pr-commenter.yaml) you'll need to grant:
```yaml
permissions:
  contents: read
  pull-requests: write
```

### Merging Pull Requests

For workflows that merge PRs, such as [merge-branch.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/merge-branch.yaml) you'll need to grant:
```yaml
permissions:
  contents: write
  pull-requests: write
```
