# GitHub Actions - Reusable Workflows Library

GitHub Actions reusable workflows library to be reused between GitHub repos.

See [Documentation](https://docs.github.com/en/actions/using-workflows/reusing-workflows#calling-a-reusable-workflow) for how to call these workflows directly from your own GitHub Actions workflow.

## Examples

In your GitHub repo, import these workflows by adding small yaml files to the `.github/workflows/` directory.

<!-- INDEX_START -->

- [Lint YAML](#lint-yaml)
- [Lint JSON](#lint-json)
- [Lint XML](#lint-xml)
- [Lint Bash / Shell Scripts](#lint-bash--shell-scripts)
- [Lint Python](#lint-python)
  - [PyLint](#pylint)
  - [Flake8](#flake8)
- [Lint README / Markdown documentation](#lint-readme--markdown-documentation)
- [Lint GitHub CODEOWNERS](#lint-github-codeowners)
- [Security - Scan for Secrets & Issues](#security---scan-for-secrets--issues)
  - [SonarCloud](#sonarcloud)
  - [Semgrep Local](#semgrep-local)
  - [Semgrep Cloud](#semgrep-cloud)
  - [Trivy Filesystem Scan](#trivy-filesystem-scan)
  - [Trivy Docker Image Scan](#trivy-docker-image-scan)
  - [Grype Filesystem Scan](#grype-filesystem-scan)
- [Analyze your Terraform code security & best practices](#analyze-your-terraform-code-security--best-practices)
  - [tfsec](#tfsec)
  - [tflint](#tflint)
  - [Checkov](#checkov)
- [Terraform Plan & Apply](#terraform-plan--apply)
- [Lint Ansible Playbooks](#lint-ansible-playbooks)
- [Lint Packer HCL](#lint-packer-hcl)
- [Lint Redhat Kickstart](#lint-redhat-kickstart)
- [Lint Debian Preseed](#lint-debian-preseed)
- [Lint Ubuntu AutoInstaller Cloud Init](#lint-ubuntu-autoinstaller-cloud-init)
- [Lint Jenkinsfiles](#lint-jenkinsfiles)
- [Lint Groovy](#lint-groovy)
- [Lint Javascript](#lint-javascript)
- [Docker Build and push to DockerHub](#docker-build-and-push-to-dockerhub)
- [Docker Build and push to AWS ECR](#docker-build-and-push-to-aws-ecr)
- [Docker Build and push to multiple registries](#docker-build-and-push-to-multiple-registries)
- [Kubernetes - Pluto - Check for Outdated APIs](#kubernetes---pluto---check-for-outdated-apis)
- [Kubernetes - Polaris - Security & Best Practices Check](#kubernetes---polaris---security--best-practices-check)
- [Check for Broken URL Links](#check-for-broken-url-links)
- [Auto-Merge Production hotfixes back to Staging](#auto-merge-production-hotfixes-back-to-staging)
- [Mirror Repos to GitLab for DR Backups](#mirror-repos-to-gitlab-for-dr-backups)
- [AWS CodeArtifact - Publish a Python Package](#aws-codeartifact---publish-a-python-package)
- [Permissions](#permissions)
  - [Security Alerts](#security-alerts)
- [Linting Auto-fixers](#linting-auto-fixers)
- [Creating or Commenting on Pull Requests](#creating-or-commenting-on-pull-requests)
- [Merging Pull Requests](#merging-pull-requests)
- [Production](#production)

<!-- INDEX_END -->

## Lint YAML

Finds all YAML in your repo and lints it.

[![YAML](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/yaml.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/yaml.yaml)

Copy this into `.github/workflows/yaml.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.yml'
      - '**/*.yaml'
jobs:
  check_yaml:
    uses: HariSekhon/GitHub-Actions/.github/workflows/yaml.yaml@master
 ```

## Lint JSON

Finds all JSON in your repo and lints it.

[![JSON](https://github.com/HariSekhon/Templates/actions/workflows/json.yaml/badge.svg)](https://github.com/HariSekhon/Templates/actions/workflows/json.yaml)

Copy this into `.github/workflows/json.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.json'
jobs:
  check_json:
    uses: HariSekhon/GitHub-Actions/.github/workflows/json.yaml@master
 ```

## Lint XML

Finds all XML in your repo and lints it.

[![XML](https://github.com/HariSekhon/Templates/actions/workflows/xml.yaml/badge.svg)](https://github.com/HariSekhon/Templates/actions/workflows/xml.yaml)

Copy this into `.github/workflows/xml.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.xml'
jobs:
  check_xml:
    uses: HariSekhon/GitHub-Actions/.github/workflows/xml.yaml@master
 ```

## Lint Bash / Shell Scripts

Finds all `*.sh` scripts in your repo and lints them.

[![Shellcheck](https://github.com/HariSekhon/DevOps-Bash-tools/actions/workflows/shellcheck.yaml/badge.svg)](https://github.com/HariSekhon/DevOps-Bash-tools/actions/workflows/shellcheck.yaml)

Copy this into `.github/workflows/shellcheck.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.sh'
jobs:
  shellcheck:
    uses: HariSekhon/GitHub-Actions/.github/workflows/shellcheck.yaml@master
 ```

## Lint Python

### PyLint

Finds all `*.py` code in your repo and lints it.

[![PyLint](https://github.com/HariSekhon/pylib/actions/workflows/pylint.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/pylint.yaml)

Copy this into `.github/workflows/pylint.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.py'
jobs:
  pylint:
    uses: HariSekhon/GitHub-Actions/.github/workflows/pylint.yaml@master
    with:
      python-version: '3.10'
 ```

### Flake8

Finds all `*.py` code in your repo and lints it.

[![Flake8](https://github.com/HariSekhon/pylib/actions/workflows/flake8.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/flake8.yaml)

Copy this into `.github/workflows/flake8.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.py'
jobs:
  flake8:
    uses: HariSekhon/GitHub-Actions/.github/workflows/flake8.yaml@master
    with:
      python-version: '3.10'
 ```

## Lint README / Markdown documentation

Finds all markdown files in your repo and lints them.

[![Markdown](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/markdown.yaml/badge.svg)](https://github.com/HariSekhon/Templates/actions/workflows/markdown.yaml)

Copy this into `.github/workflows/markdown.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.md'
jobs:
  check_markdown:
    uses: HariSekhon/GitHub-Actions/.github/workflows/markdown.yaml@master
 ```

## Lint GitHub CODEOWNERS

Lints the GitHub `CODEOWNERS` / `.github/CODEOWNERS` files.

[![Codeowners](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/codeowners.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/codeowners.yaml)

Copy this into `.github/workflows/codeowners.yaml`:

```yaml
on:
  push:
    paths:
      - CODEOWNERS
      - .github/CODEOWNERS
jobs:
  check_codeowners:
    uses: HariSekhon/GitHub-Actions/.github/workflows/codeowners.yaml@master
 ```

## Security - Scan for Secrets & Issues

### SonarCloud

[![SonarCloud](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/sonarcloud.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/sonarcloud.yaml)

```yaml
on: [push]
jobs:
  SonarCloud:
    name: SonarCloud
    uses: HariSekhon/GitHub-Actions/.github/workflows/sonarcloud.yaml@master
    secrets:
      SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
```

Alerts for the above badge appears in the SonarCloud dashboard at:

<https://sonarcloud.io/>

The badge will go red only if failing to run and publish to SonarCloud, whether there are any alerts of not.
You must check the dashboard.

### Semgrep Local

[![Semgrep](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/semgrep.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/semgrep.yaml)

Create `.github/workflows/semgrep.yaml` containing:

```yaml
on: [push]
jobs:
  semgrep:
    uses: HariSekhon/GitHub-Actions/.github/workflows/semgrep.yaml@master
```

Alerts for the above badge appear under the GitHub repo's `Security` tab -> `Code scanning alerts`.

The badge will go red if there are any alerts.

### Semgrep Cloud

[![Semgrep Cloud](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/semgrep-cloud.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/semgrep-cloud.yaml)

Create `.github/workflows/semgrep-cloud.yaml` containing:

```yaml
on: [push]
jobs:
  semgrep:
    uses: HariSekhon/GitHub-Actions/.github/workflows/semgrep-cloud.yaml@master
    secrets:
      SEMGREP_APP_TOKEN: ${{ secrets.SEMGREP_APP_TOKEN }}
```

 Alerts for the above badge appears in the Semgrep dashboard at:

<https://semgrep.dev>

The badge will go red only if failing to run and publish to Semgrep Cloud, whether there are any alerts of not.
You must check the dashboard.

### Trivy Filesystem Scan

[![Trivy Filesystem Scan](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/trivy.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/trivy.yaml)

Alerts for the above badge appear under the GitHub repo's `Security` tab -> `Code scanning alerts`.

```yaml
on:
  push:
    paths-ignore:
      - '**/*.md'
jobs:
  trivy:
    uses: HariSekhon/GitHub-Actions/.github/workflows/trivy.yaml@master
```

### Trivy Docker Image Scan

[![Trivy Docker Image Scan](https://github.com/HariSekhon/DevOps-Bash-tools/actions/workflows/trivy_image.yaml/badge.svg)](https://github.com/HariSekhon/DevOps-Bash-tools/actions/workflows/trivy_image.yaml)

Alerts for the above badge appear under the GitHub repo's `Security` tab -> `Code scanning alerts`.

```text
on:
  push:
    paths-ignore:
      - '**/*.md'
jobs:
  trivy:
    uses: HariSekhon/GitHub-Actions/.github/workflows/trivy_image.yaml@master
    with:
      docker_image: harisekhon/bash-tools
      severity: ''
```

### Grype Filesystem Scan

[![Grype](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/grype.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/grype.yaml)

Alerts for the above badge appear under the GitHub repo's `Security` tab -> `Code scanning alerts`.

```yaml
on: [push]
jobs:
  grype:
    uses: HariSekhon/GitHub-Actions/.github/workflows/grype.yaml@master
```

## Analyze your Terraform code security & best practices

### tfsec

[![tfsec](https://github.com/HariSekhon/Terraform/actions/workflows/tfsec.yaml/badge.svg)](https://github.com/HariSekhon/Terraform/actions/workflows/tfsec.yaml)

Alerts appear under `Security` -> `Code scanning alerts`.

Create `.github/workflows/tfsec.yaml` containing:

```yaml
on:
  push:
    paths:
      - '**/*.tf'
      - '**/*.tfvars'
      - '**/*.hcl'
jobs:
  tfsec:
    uses: HariSekhon/GitHub-Actions/.github/workflows/tfsec.yaml@master
```

### tflint

[![tflint](https://github.com/HariSekhon/Terraform/actions/workflows/tflint.yaml/badge.svg)](https://github.com/HariSekhon/Terraform/actions/workflows/tflint.yaml)

Create `.github/workflows/tflint.yaml` containing:

```yaml
on:
  push:
    paths:
      - '**/*.tf'
      - '**/*.tfvars'
      - '**/*.hcl'
jobs:
  tfsec:
    uses: HariSekhon/GitHub-Actions/.github/workflows/tflint.yaml@master
```

### Checkov

[![checkov](https://github.com/HariSekhon/Terraform/actions/workflows/checkov.yaml/badge.svg)](https://github.com/HariSekhon/Terraform/actions/workflows/checkov.yaml)

Alerts appear under `Security` -> `Code scanning alerts`.

Checkov can scan more than just Terraform code, so you probably don't want to restrict to only the Terraform file
extensions paths filter used in the above tfsec workflow.

Create `.github/workflows/checkov.yaml` containing:

```yaml
on: [push]
jobs:
  checkov:
    uses: HariSekhon/GitHub-Actions/.github/workflows/checkov.yaml@master
```

## Terraform Plan & Apply

Plans - updates Pull Requests with the results of validation, format check and full Change Plan outputs

Apply - applies when merged to default branch, eg. `master` or `main`

```yaml
on: [push, pull_request]
jobs:
  terraform:
    uses: HariSekhon/GitHub-Actions/.github/workflows/terraform.yaml@master
    with:
      dir: path/to/terraform/code
      args: -var-file=some-other.tfvars
    secrets:
      ...
```

For more sophisticated examples including approvals, secrets, branch and path selection etc. see my
[Terraform repo](https://github.com/HariSekhon/Terraform)'s templates for
[terraform-plan.yaml](https://github.com/HariSekhon/Terraform/blob/master/.github/workflows/terraform-plan.yaml.template) and
[terraform-apply.yaml](https://github.com/HariSekhon/Terraform/blob/master/.github/workflows/terraform-apply.yaml.template)

## Lint Ansible Playbooks

Finds all Ansible `playbook.y*ml` in your repo and lints them.

[![Ansible](https://github.com/HariSekhon/Ansible/actions/workflows/ansible-playbook-syntax.yaml/badge.svg)](https://github.com/HariSekhon/Ansible/actions/workflows/ansible-playbook-syntax.yaml)

Copy this into `.github/workflows/ansible-playbook-syntax.yaml`:

```yaml
on:
  push:
    paths:
      - '**/playbook.yml'
      - '**/playbook.yaml'
jobs:
  check_ansible_playbook_syntax:
    uses: HariSekhon/GitHub-Actions/.github/workflows/ansible-playbook-syntax.yaml@master
 ```

## Lint Packer HCL

Finds all `*.pkr.hcl` Packer code in your repo and lints them.

[![Packer](https://github.com/HariSekhon/Packer/actions/workflows/packer.yaml/badge.svg)](https://github.com/HariSekhon/Packer/actions/workflows/packer.yaml)

Copy this into `.github/workflows/packer.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.pkr.hcl'
jobs:
  check_packer_hcl:
    uses: HariSekhon/GitHub-Actions/.github/workflows/packer.yaml@master
 ```

## Lint Redhat Kickstart

Lints Redhat Kickstart automated installer files.

[![Kickstart](https://github.com/HariSekhon/Packer/actions/workflows/kickstart.yaml/badge.svg)](https://github.com/HariSekhon/Packer/actions/workflows/kickstart.yaml)

Copy this into `.github/workflows/kickstart.yaml`:

```yaml
on:
  push:
    paths:
      - '**/anaconda-ks.cfg'
      - '**/ks.cfg'
      - '**/kickstart.cfg'
jobs:
  check_kickstart:
    uses: HariSekhon/GitHub-Actions/.github/workflows/kickstart.yaml@master
    with:
      files: installers/anaconda-ks.cfg
 ```

## Lint Debian Preseed

Lints Debian Preseed automated installer files.

[![Preseed](https://github.com/HariSekhon/Packer/actions/workflows/preseed.yaml/badge.svg)](https://github.com/HariSekhon/Packer/actions/workflows/preseed.yaml)

Copy this into `.github/workflows/preseed.yaml`:

```yaml
on:
  push:
    paths:
      - '**/preseed.cfg'
jobs:
  check_preseed:
    uses: HariSekhon/GitHub-Actions/.github/workflows/preseed.yaml@master
    with:
      files: installers/preseed.cfg
 ```

## Lint Ubuntu AutoInstaller Cloud Init

Lints Ubuntu AutoInstaller Cloud Init automated installer files.

[![AutoInstaller](https://github.com/HariSekhon/Packer/actions/workflows/autoinstall-user-data.yaml/badge.svg)](https://github.com/HariSekhon/Packer/actions/workflows/autoinstall-user-data.yaml)

Copy this into `.github/workflows/autoinstall-user-data.yaml`:

```yaml
on:
  push:
    paths:
      - '**/autoinstall-user-data'
jobs:
  check_cloudinit:
    uses: HariSekhon/GitHub-Actions/.github/workflows/autoinstall-user-data.yaml@master
    with:
      files: installers/autoinstall-user-data
 ```

## Lint Jenkinsfiles

Finds all files named `Jenkinsfile` in the repo and lints them using a live Jenkins in docker.

[![Jenkinsfile](https://github.com/HariSekhon/Jenkins/actions/workflows/jenkinsfile.yaml/badge.svg)](https://github.com/HariSekhon/Jenkins/actions/workflows/jenkinsfile.yaml)

Create `.github/workflows/jenkinsfile.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*Jenkinsfile*'
jobs:
  jenkinsfile:
    uses: HariSekhon/GitHub-Actions/.github/workflows/jenkinsfile.yaml@master
```

## Lint Groovy

Finds all Groovy files named `*.groovy` in the repo and lints them using `groovyc`.

This is a basic check but good for a Jenkins Groovy Shared Library.

[![Groovy](https://github.com/HariSekhon/Jenkins/actions/workflows/groovyc.yaml/badge.svg)](https://github.com/HariSekhon/Jenkins/actions/workflows/groovyc.yaml)

Create `.github/workflows/groovyc.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.groovy'
jobs:
  check_groovyc:
    uses: HariSekhon/GitHub-Actions/.github/workflows/groovyc.yaml@master
```

## Lint Javascript

Finds all Javascript files named `*.js` in the repo and lints them using `eslint`.

[![EsLint](https://github.com/HariSekhon/TamperMonkey/actions/workflows/eslint.yaml/badge.svg)](https://github.com/HariSekhon/TamperMonkey/actions/workflows/eslint.yaml)

Create `.github/workflows/eslint.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.js'
      - package.json
      - package-lock.json
jobs:
  check_eslint:
    uses: HariSekhon/GitHub-Actions/.github/workflows/eslint.yaml@master
```

## Docker Build and push to DockerHub

[![Docker Build DevOps Bash Tools (Ubuntu)](https://github.com/HariSekhon/Dockerfiles/actions/workflows/docker_build_devops_bash_tools_ubuntu.yaml/badge.svg)](https://github.com/HariSekhon/Dockerfiles/actions/workflows/docker_build_devops_bash_tools_ubuntu.yaml)

Create `.github/workflows/dockerhub_build.yaml`:

```yaml
on: [push]
jobs:
  docker_build:
    uses: HariSekhon/GitHub-Actions/.github/workflows/dockerhub_build.yaml@master
    with:
      repo: harisekhon/bash-tools  # DockerHub user/repo
      tags: latest ubuntu          # builds, tags as harisekhon/bash-tools:latest and harisekhon/bash-tools:ubuntu and pushes to DockerHub
      context: devops-bash-tools-ubuntu  # path to dir containing the source and Dockerfile
      #max-cache: true                   # if you need multi-stage caching (uses a separate cache image)
    secrets:
      DOCKERHUB_USER: ${{ secrets.DOCKERHUB_USER }}
      DOCKERHUB_TOKEN: ${{ secrets.DOCKERHUB_TOKEN }}
```

## Docker Build and push to AWS ECR

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

## Docker Build and push to multiple registries

Supports building + pushing to any combination of the following, just add the relevant secrets, see [docker_build.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/docker_build.yaml) for details:

- ACR  - Azure Container Registry
- ECR  - AWS Elastic Container Registry
- GCR  - Google Container Registry
- GAR  - Google Artifact Registry
- GHCR - GitHub Container Registry
- GitLab Registry
- Quay.io Registry
- DockerHub

Create `.github/workflows/docker_build.yaml`:

```yaml
on: [push]
jobs:
  docker_build:
    uses: HariSekhon/GitHub-Actions/.github/workflows/docker_build.yaml@master
    with:
      repo_tags: |
        harisekhon/bash-tools:latest
        ghcr.io/harisekhon/bash-tools:latest
      context: devops-bash-tools-ubuntu  # path to dir containing the source and Dockerfile
    # GHCR uses the local github.token, for other registries, add secrets, see docker_build.yaml for details
    secrets:
      DOCKERHUB_USER: ${{ secrets.DOCKERHUB_USER }}
      DOCKERHUB_TOKEN: ${{ secrets.DOCKERHUB_TOKEN }}
```

## Kubernetes - Pluto - Check for Outdated APIs

Checks all Kubernetes YAML files for outdated API objects using Pluto.

[![Pluto](https://github.com/HariSekhon/Kubernetes-configs/actions/workflows/pluto.yaml/badge.svg)](https://github.com/HariSekhon/Kubernetes-configs/actions/workflows/pluto.yaml)

Create `.github/workflows/pluto.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.yaml'
jobs:
  pluto:
    uses: HariSekhon/GitHub-Actions/.github/workflows/pluto.yaml@master
```

## Kubernetes - Polaris - Security & Best Practices Check

Checks all Kubernetes YAML files for security issues and best practices.

Polaris currently fails on very advanced patches such as found in my
[Kubernetes-configs](https://github.com/HariSekhon/Kubernetes-configs) repo.

[![Polaris](https://github.com/HariSekhon/Kubernetes-configs/actions/workflows/polaris.yaml/badge.svg)](https://github.com/HariSekhon/Kubernetes-configs/actions/workflows/polaris.yaml)

Create `.github/workflows/polaris.yaml`:

```yaml
on:
  push:
    paths:
      - '**/*.yaml'
jobs:
  polaris:
    uses: HariSekhon/GitHub-Actions/.github/workflows/polaris.yaml@master
```

## Check for Broken URL Links

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

## Auto-Merge Production hotfixes back to Staging

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

## Mirror Repos to GitLab for DR Backups

Mirrors all/given GitHub repos to GitLab - including all branches and tags, and GitHub repo description.

There are similar workflows in this repo to mirror GitHub repos to [AWS CodeCommit](https://aws.amazon.com/codecommit/) or [GCP Source Repos](https://source.cloud.google.com/onboarding/welcome) too.

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

## AWS CodeArtifact - Publish a Python Package

```yaml
on:
  tags:
    - v*

jobs:
  aws_codeartifact_python_publish:
    uses: HariSekhon/GitHub-Actions/.github/workflows/codeartifact_python_publish.yaml@master
    with:
      domain: mycompany     # your AWS CodeArtifact service domain name
      repo: mycompany-core  # your CodeArtifact repo name
      #command: make publish_package  # default. Can be any command using CODEARTIFACT_AUTH_TOKEN and CODEARTIFACT_REPO_URL
    secrets:
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      AWS_DEFAULT_REGION: ${{ secrets.AWS_DEFAULT_REGION }}
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
- [trivy.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/trivy.yaml)

## Linting Auto-fixers

For workflows that lint-and-fix code, such as [terraform-fmt-write.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/terraform-fmt-write.yaml), you'll need to grant:

```yaml
permissions:
  contents: write       # if called by on: push
  pull-requests: write  # if called by on: pull_request
```

## Creating or Commenting on Pull Requests

For workflows that create or comment on PRs, such as [terraform.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/terraform.yaml) and [tfsec-pr-commenter.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/tfsec-pr-commenter.yaml) you'll need to grant:

```yaml
permissions:
  contents: read
  pull-requests: write
```

## Merging Pull Requests

For workflows that merge PRs, such as [merge-branch.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/merge-branch.yaml) you'll need to grant:

```yaml
permissions:
  contents: write
  pull-requests: write
```

## Production

As per [GitHub Actions Security Best Practices](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#using-third-party-actions), you should consider fixing your `@<ref>` to an exact immutable hashref.

Alternatively, you may want to fork this repo to have full control over all updates.

You can create environment branches in your forked repo to stage updates across dev/staging/production and enable the [fork-sync](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/fork-sync.yaml) github actions workflow in your fork to keep the master branch sync'd every few hours, and the [fork-update-pr](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/fork-update-pr.yaml) github actions workflow to raise GitHub Pull Requests for your environment branches to audit, authorize & control updates.
