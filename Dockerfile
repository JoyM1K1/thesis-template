FROM paperist/alpine-texlive-ja:latest
RUN apk add --update make
# tlmgrでpackage追加するならここに書く