FROM python:3.12.4-bookworm@sha256:23155f230e6f43ecb0670dc680feb3271d96b9ce99fe82b051bf7b668755e2ef

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
