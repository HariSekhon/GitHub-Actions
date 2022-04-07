# GitHub Actions

[![Validation](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/validate.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/validate.yaml)
[![Semgrep](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/semgrep.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/semgrep.yaml)
[![Kics](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/kics.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/kics.yaml)
[![URL Links](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/url_links.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/url_links.yaml)
[![GitHub stars](https://img.shields.io/github/stars/HariSekhon/GitHub-Actions?logo=github)](https://github.com/HariSekhon/GitHub-Actions/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/HariSekhon/GitHub-Actions?logo=github)](https://github.com/HariSekhon/GitHub-Actions/network)
[![Lines of Code](https://img.shields.io/badge/lines%20of%20code-2.1k-lightgrey?logo=codecademy)](https://github.com/HariSekhon/GitHub-Actions)
[![License](https://img.shields.io/github/license/HariSekhon/GitHub-Actions)](https://github.com/HariSekhon/GitHub-Actions/blob/master/LICENSE)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/HariSekhon/GitHub-Actions?logo=github)](https://github.com/HariSekhon/GitHub-Actions/commits/master)

[![CI Builds Overview](https://img.shields.io/badge/CI%20Builds-Overview%20Page-blue?logo=circleci)](https://harisekhon.github.io/CI-CD/)
[![Repo on Azure DevOps](https://img.shields.io/badge/repo-Azure%20DevOps-0078D7?logo=azure%20devops)](https://dev.azure.com/harisekhon/GitHub/_git/GitHub-Actions)
[![Repo on GitHub](https://img.shields.io/badge/repo-GitHub-2088FF?logo=github)](https://github.com/HariSekhon/GitHub-Actions)
[![Repo on GitLab](https://img.shields.io/badge/repo-GitLab-FCA121?logo=gitlab)](https://gitlab.com/HariSekhon/GitHub-Actions)
[![Repo on BitBucket](https://img.shields.io/badge/repo-BitBucket-0052CC?logo=bitbucket)](https://bitbucket.org/HariSekhon/GitHub-Actions)

GitHub Actions master template & GitHub Actions Shared Workflows library.

- [main.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/main.yaml) - GitHub Actions master workflow template
- [.github/workflows/](https://github.com/HariSekhon/GitHub-Actions/tree/master/.github/workflows) - GitHub Actions Reusable Workflows Library

See [Documentation](https://docs.github.com/en/actions/using-workflows/reusing-workflows#calling-a-reusable-workflow) for how to call these workflows directly from your own GitHub Actions workflow.

Fork this repo to have full control over all updates via Pull Requests. Create environment branches to stage updates across dev/staging/production.

Forked from [HariSekhon/Templates](https://github.com/HariSekhon/Templates), for which this is now a submodule.

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
    uses: HariSekhon/Gi/tHub-Actions/.github/workflows/tfsec.yaml@master
```

### Docker Build and push to DockerHub

[![Docker Build DevOps Bash Tools (Ubuntu)](https://github.com/HariSekhon/Dockerfiles/actions/workflows/docker_build_devops_bash_tools_ubuntu.yaml/badge.svg)](https://github.com/HariSekhon/Dockerfiles/actions/workflows/docker_build_devops_bash_tools_ubuntu.yaml)

Create `.github/workflows/dockerhub_build.yaml`:
```yaml
on: [push]
jobs:
  docker_build:
    uses: HariSekhon/GitHub-Actions/.github/workflows/dockerhub_build.yaml@master
    with:
      repo: user/repo  # your DockerHub user/repo
      tags: latest v1.1
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
      repo: MY_ECR_REPO
    secrets:
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      AWS_DEFAULT_REGION: ${{ secrets.AWS_DEFAULT_REGION }}
```
Creates several useful tags, supports multi-stage build caching, see [README](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/README.md) for details.

### Check for Broken URL Links

[![URL Links](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/url_links.yaml/badge.svg)](https://github.com/HariSekhon/GitHub-Actions/actions/workflows/url_links.yaml)

Create `.github/workflows/url_links.yaml`:
```yaml
on: [push]
jobs:
  url_links:
    uses: HariSekhon/GitHub-Actions/.github/workflows/url_links.yaml@master
```
See [README](https://github.com/HariSekhon/GitHub-Actions/blob/master/.github/workflows/README.md) for details on ignoring inaccessible / partially constructed links or those containing variables

### Auto-Merge Production hotfixes back to Staging

Merges via a Pull Request for full auditing.

Create `.github/workflows/merge_production_to_staging.yaml`:
```yaml
on: [push]
jobs:
  merge:
    if: github.ref_name == 'production'
    uses: HariSekhon/GitHub-Actions/.github/workflows/merge-branch.yaml@master
    with:
      head: production  # from
      base: staging     # to
```

### Mirror Repos to GitLab for DR Backups

Mirrors all/given GitHub repos to GitLab - including all branches and tags, and GitHub repo description

```yaml
on:
  schedule:
    # mirror to GitLab hourly
    - cron: '0 0 * * *'

jobs:
  gitlab_mirror:
    uses: HariSekhon/GitHub-Actions/.github/workflows/gitlab-mirror.yaml@master
    with:
      #organization: my-org    # optional: mirror your company's repos instead of your personal repos
      #repos: repo1 repo2 ...  # list of repos to mirror, space separated, rather than all repos
    secrets:
      GH_TOKEN: ${{ secrets.GH_TOKEN }}
      GITLAB_TOKEN: ${{ secrets.GITLAB_TOKEN }}
```

### See Also

- [Jenkins](https://github.com/harisekhon/jenkins) - Advanced Jenkinsfile & Jenkins Shared Library

- [Templates](https://github.com/harisekhon/templates) - Code & Config templates for many popular DevOps technologies

- [DevOps Bash Tools](https://github.com/harisekhon/devops-bash-tools) - 700+ DevOps Bash Scripts, Advanced `.bashrc`, `.vimrc`, `.screenrc`, `.tmux.conf`, `.gitconfig`, CI configs & Utility Code Library - AWS, GCP, Kubernetes, Docker, Kafka, Hadoop, SQL, BigQuery, Hive, Impala, PostgreSQL, MySQL, LDAP, DockerHub, Jenkins, Spotify API & MP3 tools, Git tricks, GitHub API, GitLab API, BitBucket API, Code & build linting, package management for Linux / Mac / Python / Perl / Ruby / NodeJS / Golang, and lots more random goodies

- [SQL Scripts](https://github.com/HariSekhon/SQL-scripts) - 100+ SQL Scripts - PostgreSQL, MySQL, AWS Athena, Google BigQuery

- [Kubernetes configs](https://github.com/HariSekhon/Kubernetes-configs) - Kubernetes YAML configs - Best Practices, Tips & Tricks are baked right into the templates for future deployments

- [DevOps Python Tools](https://github.com/harisekhon/devops-python-tools) - 80+ DevOps CLI tools for AWS, GCP, Hadoop, HBase, Spark, Log Anonymizer, Ambari Blueprints, AWS CloudFormation, Linux, Docker, Spark Data Converters & Validators (Avro / Parquet / JSON / CSV / INI / XML / YAML), Elasticsearch, Solr, Travis CI, Pig, IPython

- [The Advanced Nagios Plugins Collection](https://github.com/harisekhon/nagios-plugins) - 450+ programs for Nagios monitoring your Hadoop & NoSQL clusters. Covers every Hadoop vendor's management API and every major NoSQL technology (HBase, Cassandra, MongoDB, Elasticsearch, Solr, Riak, Redis etc.) as well as message queues (Kafka, RabbitMQ), continuous integration (Jenkins, Travis CI) and traditional infrastructure (SSL, Whois, DNS, Linux)

- [DevOps Perl Tools](https://github.com/harisekhon/perl-tools) - 25+ DevOps CLI tools for Hadoop, HDFS, Hive, Solr/SolrCloud CLI, Log Anonymizer, Nginx stats & HTTP(S) URL watchers for load balanced web farms, Dockerfiles & SQL ReCaser (MySQL, PostgreSQL, AWS Redshift, Snowflake, Apache Drill, Hive, Impala, Cassandra CQL, Microsoft SQL Server, Oracle, Couchbase N1QL, Dockerfiles, Pig Latin, Neo4j, InfluxDB), Ambari FreeIPA Kerberos, Datameer, Linux...

- [HAProxy Configs](https://github.com/HariSekhon/HAProxy-configs) - 80+ HAProxy Configs for Hadoop, Big Data, NoSQL, Docker, Elasticsearch, SolrCloud, HBase, Cloudera, Hortonworks, MapR, MySQL, PostgreSQL, Apache Drill, Hive, Presto, Impala, ZooKeeper, OpenTSDB, InfluxDB, Prometheus, Kibana, Graphite, SSH, RabbitMQ, Redis, Riak, Rancher etc.

- [Dockerfiles](https://github.com/HariSekhon/Dockerfiles) - 50+ DockerHub public images for Docker & Kubernetes - Hadoop, Kafka, ZooKeeper, HBase, Cassandra, Solr, SolrCloud, Presto, Apache Drill, Nifi, Spark, Mesos, Consul, Riak, OpenTSDB, Jython, Advanced Nagios Plugins & DevOps Tools repos on Alpine, CentOS, Debian, Fedora, Ubuntu, Superset, H2O, Serf, Alluxio / Tachyon, FakeS3
