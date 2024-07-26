FROM python:3.12.4-bookworm@sha256:3d87cd922e0349f0c19676f492091cce77d79bf9bc9507e42e03bdb8e51126e1

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
