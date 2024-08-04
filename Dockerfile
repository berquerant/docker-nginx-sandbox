FROM python:3.12.4-bookworm@sha256:40eb6aea06bc8f9f1bb1f8467dd1f06f57cb7eba38a70e65e2d26effeaf737e8

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
