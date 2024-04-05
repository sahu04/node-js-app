FROM node:18-alpine3.16

# Install required system packages
RUN apk add --update \
    git \
    jq \
    python3 \
    py3-pip \
    && rm -rf /var/cache/apk/*

# Install AWS CLI using pip
RUN pip3 install awscli
RUN npm install --save-dev prettier 
# Set up working directory
RUN mkdir /cache
WORKDIR /cache

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install --legacy-peer-deps --max-old-space-size=4096 --unsafe-perm=true --production=false

# Install development dependencies

     npm install -g npm-audit-html 
     npm install -g serverless@2.71.0

# Set Node.js options
ENV NODE_OPTIONS="--max-old-space-size=4096"

# Set default command
CMD ["bash"]

