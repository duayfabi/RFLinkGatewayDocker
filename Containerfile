FROM python:alpine3.16

LABEL maintainer="Fabien Duay <duayfabi at google's mail service dot com>"

WORKDIR /usr/src/app
RUN apk add --no-cache git && \
    git clone https://github.com/duayfabi/RFLinkGateway.git && \
    apk del git

ENV RFLINK_CONF_FILE="/config/config.json" \
	RFLINK_LOG_LEVEL="INFO" \
	RFLINK_FILE_LOG_LEVEL="INFO" \
	RFLINK_STREAM_LOG_LEVEL="INFO" \
	RFLINK_LOG_FILE="/log/RFLinkGateway.log" 

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

CMD [ "python", "RFLinkGateway/RFLinkGateway.py" ]

VOLUME /config /log

