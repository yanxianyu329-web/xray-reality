FROM alpine:latest
RUN apk add --no-cache bash curl unzip
# 下载 xray
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip -d /usr/bin/ \
    && rm xray.zip

COPY config.json /etc/xray/config.json
CMD ["xray", "-config", "/etc/xray/config.json"]
