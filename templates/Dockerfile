FROM python:3.13.0-bookworm@sha256:c8ab6e77bd9788bd7952069fc8d19e5f5c6954712f1e9a0739882963dca9438c

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

RUN pip install --no-cache-dir pipenv==2024.1.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
