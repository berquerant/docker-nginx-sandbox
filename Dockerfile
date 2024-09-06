FROM python:3.12.5-bookworm@sha256:abebed466ff3ede11c26e661d67bd6faebd58dfbd0bd8bd8b130be3730d2d35c

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
