FROM alpine
LABEL "maintainer"="Farkhad Gapparov <public@fgappar.com>"

RUN apk add nginx
COPY config/default.conf /etc/nginx/http.d/default.conf
COPY static/index.html /usr/share/nginx/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]