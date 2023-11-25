FROM python:3.8-slim-buster AS build

WORKDIR /app

ARG ENV=development
ENV ENV=${ENV} \
    # python
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONHASHSEED=random \
    # pip
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    # env
    VENV_PATH="/opt/venv"

COPY . .

# Install dependencies
RUN python -m venv ${VENV_PATH} \
    && . /opt/venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

FROM build
ENV ENV=development \
    PATH="${VENV_PATH}/bin:${PATH}"

WORKDIR /app

COPY --from=build $VENV_PATH $VENV_PATH
RUN python -m venv ${VENV_PATH} \
    && . /opt/venv/bin/activate

EXPOSE 5000

CMD ["python", "app.py"]
