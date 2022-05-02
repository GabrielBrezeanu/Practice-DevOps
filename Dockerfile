FROM python:3

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app
WORKDIR /src/django

COPY requirements.txt /src/django/

RUN pip install -r requirements.txt
COPY . /src/django/

RUN pip install --no-cache-dir Flask

COPY src/flask_entrypoint.py ./flask_entrypoint.py

EXPOSE 5000

RUN chmod -R 777 data/db/

CMD [ "python", "./flask_entrypoint.py" ]