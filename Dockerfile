FROM python:3.12.2-bookworm@sha256:afd493c07c454f712fde8f71f019ca9d0fafef50f99fcb3fbddc8543af0f89e6

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2023.10.24 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
