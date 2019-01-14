FROM python:3.7.2-alpine3.8
RUN apk add --no-cache zip
COPY package.sh .
CMD ./package.sh

