FROM python:3.13.0-bookworm@sha256:e1f3ed849515224c2d63210dfaf99d6ad696c2b45c3804d8ffc88e4873e67f31

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

RUN pip install --no-cache-dir pipenv==2024.1.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
