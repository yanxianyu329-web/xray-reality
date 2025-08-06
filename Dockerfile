FROM alpine:3.18

RUN apk add --no-cache bash curl unzip

# 下载指定版本 Xray（更稳定）
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/download/v25.8.3/Xray-linux-64.zip \
    && unzip xray.zip -d /usr/bin/ \
    && rm xray.zip

COPY config.json /etc/xray/config.json

# 暴露 8000 端口（和 config.json 对应）
EXPOSE 8000

CMD ["xray", "-config", "/etc/xray/config.json"]
