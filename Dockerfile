FROM python:3.8-slim-buster

WORKDIR /app

COPY . .

RUN pip uninstall decouple && pip3 install -r requirements.txt

CMD [ "python3", "web.py"]
