# Script to invoke SBOM API

This API is Open beta as of 2022/11/18. 
API version will likely be changed at GA.

## Usage

```
./sbom <Org name> <Project name>
```

Where:
- `Org name` is something like `masatomo.ito-qx0` (Note: It's organization name **NOT display name**)
- `Project name` is something like `masa-snyk/goof:package.json` 

## Example

./sbom.sh finance-svs "shawnsnyk/goof:package.json"
