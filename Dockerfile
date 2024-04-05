 FROM node:18-alpine3.16
# Install necessary packages and dependencies
RUN apk add --update
RUN apk add git
RUN apk add jq
RUN mkdir /cache
WORKDIR /cache
COPY package.json ./
RUN yarn global add prettier
RUN npm install --legacy-peer-deps 
RUN npm install -g npm-audit-html
RUN npm install -g serverless@2.71.0
RUN apk add python3 py-pip
RUN pip install PyYAML==5.3.1 && pip install awscli
