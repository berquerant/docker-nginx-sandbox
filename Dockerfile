FROM python:3.12.2-bookworm@sha256:a313e31ad26f3d8e6fb14dd0c6e2f181fa9c5bc099b21d93583035d04a3cc308

WORKDIR /app/src

COPY files/api/Pipfile Pipfile
COPY files/api/Pipfile.lock Pipfile.lock

RUN pip install --no-cache-dir pipenv==2023.10.24 \
    && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
