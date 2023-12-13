FROM python:3.12.0-bookworm@sha256:5eba34eb667213abb09a4c470365180d5706076f76945e49b963ac15d428a684

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2023.10.24 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
