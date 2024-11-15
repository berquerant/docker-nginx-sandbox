FROM python:3.13.0-bookworm@sha256:ecd27b6c43d8d84b0058e7db4aaa06a1bfe970d0fb9bb7cf39f9536850f71510

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

RUN pip install --no-cache-dir pipenv==2024.4.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
