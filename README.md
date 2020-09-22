# OpenFaaS GitHub action

GitHub action for building OpenFaaS functions

## Inputs

### `action`

**Required** 	`build` or `deploy`

### `stack-file`

**Required** 	The OpenFaaS function definition file.

### `openfaas-username`

**Required** User for authenticating at OpenFaaS gateway. Default `"admin"`.

### `openfaas-password`

**Required** Password for authenticating at OpenFaaS gateway

### `template-url`

URL of the repository with templates

## Outputs

### `registry`

Function image registry

### `repository`

Function image repository

### `tag`

Function image tag

## Example usage

```yaml
uses: tunein/action-openfaas@v*.*.*
env:
  OPENFAAS_URL: ${{ secrets.OPENFAAS_GATEWAY }}
with:
  action:  'build'
  stack-file: './function.yml'
  openfaas-username: ${{ secrets.OPENFAAS_USERNAME }}
  openfaas-password: ${{ secrets.OPENFAAS_PASSWORD }}
  template-url: 'https://github.com/serhiisavruk/openfaas-template'

  ...

  env:
    ECR_REGISTRY: ${{ steps.build.outputs.registry }}
    ECR_REPOSITORY: ${{ steps.build.outputs.repository }}
    IMAGE_TAG: ${{ steps.build.outputs.tag }}
```
