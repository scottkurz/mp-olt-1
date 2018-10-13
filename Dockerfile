FROM open-liberty as server-setup
COPY /target/article1.zip /config/
RUN unzip /config/article1.zip && \
    mv /wlp/usr/servers/article1Server/* /config/ && \
    rm -rf /config/wlp && \
    rm -rf /config/article1.zip

FROM open-liberty
LABEL maintainer="Graham Charters" vendor="IBM" github="https://github.com/WASdev/ci.maven"
COPY --from=server-setup /config/ /config/
EXPOSE 9080 9443
