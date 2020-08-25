# OpenFaaS/ECR GitHub action

GitHub action for building OpenFaaS functions and deploying images to ECR.

## Inputs

### `stack-file`

**Required** 	The OpenFaaS function definition file.

### `openfaas-username`

**Required** User for authenticating at OpenFaaS gateway. Default `"admin"`.

### `openfaas-password`

**Required** Password for authenticating at OpenFaaS gateway

## Example usage

```yaml
uses: actions/actionn-openfaas-ecr@v1
env:
  OPENFAAS_URL: ${{ secrets.OPENFAAS_GATEWAY }}
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  AWS_DEFAULT_REGION: ${{ secrets.AWS_DEFAULT_REGION }}
with:
  stack-file: './function.yml'
  openfaas-username: ${{ secrets.OPENFAAS_USERNAME }}
  openfaas-password: ${{ secrets.OPENFAAS_PASSWORD }}
```
