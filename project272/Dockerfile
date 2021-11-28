
FROM python:3.8.10-alpine3.13

WORKDIR /app/

ENV VERSION 1.0.0
ENV FLASK_HOST 0.0.0.0

RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
RUN apk add --no-cache jpeg-dev zlib-dev

COPY . .

RUN pip install -r requirements.txt
RUN apk del .tmp

CMD ["python", "server.py"]