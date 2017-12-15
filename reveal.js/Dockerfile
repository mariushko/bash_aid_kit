FROM node:9-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends bzip2 python make g++\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN groupadd -r slides && useradd -r -g slides slides

COPY Dockerfile /Dockerfile

ENV VERSION=3.6.0 \
    REPO=https://github.com/hakimel/reveal.js \
    SHA=c044177d84e959c9c41edbb4dbc9b1dffa4b40d1
RUN curl -o /tmp/reveal.js.tar.gz -sSL $REPO/archive/$VERSION.tar.gz && \
    echo "$SHA /tmp/reveal.js.tar.gz" | sha1sum --check - && \
    tar -xzf /tmp/reveal.js.tar.gz -C / && \
    rm -f /tmp/reveal.js.tar.gz && \
    mv reveal.js-$VERSION /revealjs

WORKDIR /revealjs

RUN npm install -g grunt-cli && npm install

COPY index.html /revealjs/
COPY css/slides.css /revealjs/css/

RUN chown -R slides /revealjs
USER slides

EXPOSE 8000 35729
CMD ["grunt", "serve"]
