# Lamda Python Packer

This docker image makes it possible to package an AWS python lambda function with a single line:

```bash
docker run --rm --user $(id -u):$(id -g) -v ${PWD}:/source reboot8/lambda_python_packer:python3.7
```

The output will be available under the current folder with the name deploy.zip. By default, the target runtime is **python 3.7**. 

## Details

Here are what this script does:

1. Find requirements.txt in the current folder, and include all the required packages in the final output by running `pip` with it.

2. Copy everything in the current folder, and include in the final output.

3. Put the final ourput as deploy.zip in the current directory.

## Customization

This script allows some options to customize the packaging process. If you need more options, please feel free to submit a wish in the [issue tracker](https://github.com/yefuwang/lambda_python_packer/issues), or submit a pull request.

### Python Runtime Versions

Use tags to target at different python runtime.


| Tag        | Target Runtime           |
| ------------- |:-------------:|
| latest      | The latest python version <br> supported by AWS Lambda <br> (python 3.7 as of now) |
| python3.7      | python3.7      |
| python3.6 | python3.7      |
| python2.7 | python2.7 |



## Support

All issues, comments, pull requests, are very much appreciated. Please contact the maintainer via the [GitHub repository](https://github.com/yefuwang/lambda_python_packer) of this project.

