# Lamda Python Packer

This docker image makes it possible to package an AWS python lambda function with a single line:

```bash
docker run --rm --user $(id -u):$(id -g) -v ${PWD}:/source -it yefuwang/lambda_python_packer
```

## Details

Here are what this script does:

1. Find requirements.txt in the current folder, and include all the required packages in the final output by running:
```
pip -r requirements.txt`
```

2. Copy everything in the current folder, and include in the final output.

3. Put the final ourput as deploy.zip in the current directory.


## Support

All issues, comments, pull requests, are very much appreciated. Please contact the maintainer via the [GitHub repository](https://github.com/yefuwang/lambda_python_packer) of this project.

