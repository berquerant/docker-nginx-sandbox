FROM python:3.12.0-bookworm@sha256:ebfe61739a0e0c937dfe998a9838dcf5aa2a27700d63d2387dae896d1c5005c4

WORKDIR /app/src

COPY files/api/Pipfile Pipfile

RUN pip install --no-cache-dir pipenv==2023.10.24 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
