# ARG NODE_VERSION=16.20.2
# FROM node:${NODE_VERSION}-alpine as base
# EXPOSE 3000
# WORKDIR /usr/src
# FROM base as prod
# ADD . /usr/src
# RUN npm install && npm run build
# RUN rm src -r
# RUN cd ./server && npm install
# CMD node ./server/app.js

ARG NODE_VERSION=16.20.2
FROM node:${NODE_VERSION}-alpine as base
EXPOSE 3000
WORKDIR /usr/src
ADD . /usr/src
RUN npm install && npm run build

FROM node:${NODE_VERSION}-alpine as prod
WORKDIR /usr/src
COPY --from=base /usr/src/dist /usr/src/dist
CMD node ./server/app.js