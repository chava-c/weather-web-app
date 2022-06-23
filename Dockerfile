FROM python:3.9.0b4-alpine3.12

RUN apk add apache2
RUN apk add py3-pip
RUN pip3 install --upgrade pip
RUN pip install requests

COPY weather.py /bin/weather.py
COPY root /var/spool/cron/crontabs/root

RUN chmod +x /bin/weather.py

#CMD crond -l 2 -b