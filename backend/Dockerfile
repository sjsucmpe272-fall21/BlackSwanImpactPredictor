
FROM python:3.8.10

WORKDIR /app/

ENV VERSION 1.0.0
ENV FLASK_HOST 0.0.0.0

RUN apt-get update -yy
RUN apt-get install build-essential

COPY . .

RUN pip install -r requirements.txt

CMD ["python", "server.py"]