FROM python:3.13.3-bookworm@sha256:b7ce60fbc565933c5ae088df8dbe63ffad16a634d4c575ec989e2f106f7df674

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
