FROM python:3.12.6-bookworm@sha256:78409b7acdc408ff1dbdc936e246edcb07bba423581db47399f7db3ecad68852

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.3 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
