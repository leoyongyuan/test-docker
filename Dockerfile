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
ARG INPUT_TEST_TOKEN
ENV INPUT_TEST_TOKEN ${INPUT_TEST_TOKEN}
EXPOSE 3000
WORKDIR /usr/src
ADD . /usr/src
RUN npm install && npm run build
RUN echo "测试环境变量: $INPUT_TEST_TOKEN $NODE_VERSION"


FROM node:${NODE_VERSION}-alpine as prod
EXPOSE 3000
WORKDIR /usr/src
COPY --from=base /usr/src/dist /usr/src/dist
COPY --from=base /usr/src/server /usr/src/server
RUN cd ./server && npm install
CMD node ./server/app.js