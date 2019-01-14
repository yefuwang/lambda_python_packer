#!/bin/sh

PYTHON_VERION=3.7

SRC=/source
DEST_FILE=${SRC}/deploy.zip

rm -f ${DEST_FILE}

WORK_DIR=`mktemp -d -p /tmp`
cp ${SRC}/* ${WORK_DIR} -r -v

PYENV_DIR=`mktemp -d -p /tmp`

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
    echo "Could not create temp dir"
    exit 1
fi

# deletes the temp directory
function cleanup { 
    rm -rf "$WORK_DIR"
    rm -rf "$PYENV_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

python -m venv ${PYENV_DIR}

cd ${WORK_DIR}

source $PYENV_DIR/bin/activate

rm -f ${SRC}/deploy.zip

# Install and copy dependencies, if any;
if [ -f ./requirements.txt ]; then
    pip install -r requirements.txt
    cd $PYENV_DIR/lib/python${PYTHON_VERION}/site-packages
    zip -r9q ${DEST_FILE} .
else
    echo "requirements.txt does not exist. Assuming no dependencies.."
fi

cd ${WORK_DIR}
zip -r9q ${DEST_FILE} ./*

echo "Finiishing generating deploy.zip"

