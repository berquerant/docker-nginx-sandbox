FROM python:3.12.7-bookworm@sha256:c7e6862f608cc58149ed6900a3f27ea3424661819cd610d010526ec6fc2e52a6

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

RUN pip install --no-cache-dir pipenv==2024.1.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
