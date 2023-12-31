FROM python:3.12.1-bookworm@sha256:603627dd8ce050329bce7741338ee9053e8004775d013603dd4ceefe42f99a82

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2023.10.24 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
