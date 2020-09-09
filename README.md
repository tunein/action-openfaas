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
```
