FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY crud-node-postgres/package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY ./crud-node-postgres/ .
RUN npm install -g bower
COPY ./crud-node-postgres/bower*.json ./
RUN bower install --allow-root


EXPOSE 3090
CMD [ "node", "server.js" ]