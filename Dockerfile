FROM alpine/git as git-stage

WORKDIR /src
RUN git clone https://github.com/Paul-Weaver/Digital-Resume-CSS.git .

FROM nginx:alpine

COPY --from=git-stage /src /usr/share/nginx/html


