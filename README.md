# Script to invoke SBOM API

This API is Open beta as of 2022/11/18. 
API version will likely be changed at GA.

*Current restrictions:*
- You need paid subscription to try API.
- Only cyclonedx+json format is supported.
- Only Snyk Opensource project is supported.

## Requirement

- install **httpie** (https://httpie.io/)
- install **bomber** (https://github.com/devops-kung-fu/bomber)

## Usage

To generate SBOM.

```
./sbom <Org name> <Project name>
```

To scan SBOM.

```
./bomber.sh 

Where:
- `Org name` is something like `masatomo.ito-qx0` (Note: It's organization name **NOT display name**)
- `Project name` is something like `masa-snyk/goof:package.json` 

## Example

./sbom.sh finance-svs "shawnsnyk/goof:package.json"
