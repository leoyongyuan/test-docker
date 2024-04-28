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
EXPOSE 3000
WORKDIR /usr/src
ARG TEST_TOKEN
ENV TAG_VERSION 
RUN echo "测试环境变量: $TEST_TOKEN $TAG_VERSION"
COPY --from=base /usr/src/dist /usr/src/dist
COPY --from=base /usr/src/server /usr/src/server
RUN cd ./server && npm install
CMD node ./server/app.js