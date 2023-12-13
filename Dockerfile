FROM python:3.12.1-bookworm@sha256:8c284a84bc273b858725193c1ea53192aa8cad6ca0ce3fd90b4abcfcd3cef915

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2023.10.24 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
