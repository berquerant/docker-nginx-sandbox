FROM python:3.12.4-bookworm@sha256:70b2e244053eca39a645f0479619cbfb706ed5b4812bb4e94f9e94d9e0daff88

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
