FROM python:3.12.6-bookworm@sha256:f815fb70eb02e51e341e3697b8fb974bf69bb7c9c6c933c7dffae6f32f37a5e9

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.3 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
