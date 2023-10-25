FROM python:3.12.0-bookworm

WORKDIR /app/src

COPY files/api/Pipfile Pipfile

RUN pip install --no-cache-dir pipenv==2023.10.24 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
