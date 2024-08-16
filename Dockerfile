FROM python:3.12.5-bookworm@sha256:db5117bdc617075dcfebb40b2e5e6887750f83c385ebcaf1302412a6f3b1b147

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2024.0.1 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
