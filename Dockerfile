FROM python:3.12.5-bookworm@sha256:ece3e93bb15459b7683aa1b205ab43086750cc64a088a948cf0a176f2166712c

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
