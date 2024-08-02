FROM python:3.12.4-bookworm@sha256:08ac6c57f123d1ca5dd6c786cd7ceb4251733f98efe1697042e5d28b069916e7

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
