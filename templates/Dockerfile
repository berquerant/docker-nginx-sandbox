FROM python:3.13.0-bookworm@sha256:91a40c9db8e53aa8c4cae96c24dc7135835e07c8140de233826ece4442ca8e29

WORKDIR /app/src

COPY api/Pipfile api/Pipfile.lock ./

ENV HOME=/root
ENV PYENV_ROOT="${HOME}/.pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PATH}"

# hadolint ignore=SC2016
RUN git clone https://github.com/pyenv/pyenv.git "${HOME}/.pyenv" \
 && echo 'eval "$(pyenv init -)"' >> ~/.bashrc \
 && eval "$(pyenv init -)"
RUN pip install --no-cache-dir pipenv==2024.4.0 && pipenv install

EXPOSE 8000

CMD ["pipenv", "run", "uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
