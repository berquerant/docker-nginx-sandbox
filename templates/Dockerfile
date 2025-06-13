FROM python:3.13.5-bookworm@sha256:5d0a64b7f8333d42568ae4076242d15dc22f0cb0ae26a1750cbb8a6570e48aa5

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

ENV HOME=/root
ENV PYENV_ROOT="${HOME}/.pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PATH}"

# hadolint ignore=SC2016
RUN git clone https://github.com/pyenv/pyenv.git "${HOME}/.pyenv" \
 && echo 'eval "$(pyenv init -)"' >> ~/.bashrc \
 && eval "$(pyenv init -)"
RUN pip install --no-cache-dir pipenv==2024.4.1 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
