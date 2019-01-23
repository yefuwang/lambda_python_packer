# Lamda Python Packer

This docker image makes it possible to package an AWS python lambda function with a single line:

```bash
docker run --rm --user $(id -u):$(id -g) -v ${PWD}:/source reboot8/lambda_python_packer:python3.7
```
To generate a minimized package, add envorinment variable MINIMIZE=1.

```bash
docker run --rm --user $(id -u):$(id -g) -e "MINIMIZE=1" -v ${PWD}:/source reboot8/lambda_python_packer:python3.7
```

See [minimize option ](#minimize) for details.

The output will be available under the current folder with the name deploy.zip. By default, the target runtime is **python 3.7**. 

## Details

Here are what this script does:

1. Find requirements.txt in the current folder, and include all the required packages in the final output by running `pip` with it.

2. Copy everything in the current folder, and include in the final output.

3. Put the final ourput as deploy.zip in the current directory.

## Customization

This script currently supports only one option to customize the packaging process. If you need more options, please feel free to submit a wish in the [issue tracker](https://github.com/yefuwang/lambda_python_packer/issues), or submit a pull request.

### <a id="minimize"></a>Option: MINIMIZE

The option MINIMIZE removes the following packges from your deployment:

1. Avoid installing boto3 even if it is in your requirements.txt. Boto3 is already available in the containers that runs lambdas. 

2. Rmove pip and setuptools. 

### Python Runtime Versions

Use tags to target at different python runtime.


| Tag        | Target Runtime           |
| ------------- |:-------------:|
| latest      | The latest supported by AWS (python 3.7 now) |
| python3.7      | python3.7      |
| python3.6 | python3.7      |
| python2.7 | python2.7 |



## Support

All issues, comments, pull requests, are very much appreciated. Please contact the maintainer via the [GitHub repository](https://github.com/yefuwang/lambda_python_packer) of this project.

