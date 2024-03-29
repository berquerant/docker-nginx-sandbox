FROM python:3.12.2-bookworm@sha256:20a673f2c7f7f895595f56c43cb8258681d939f65f62709b154190abeb8ae7e7

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2023.10.24 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
