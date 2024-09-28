FROM python:3.12.6-bookworm@sha256:cf440bb01a91be66b48759074a4afda9edf1d9d276e92ccb5f50046c7096eb03

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.3 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
