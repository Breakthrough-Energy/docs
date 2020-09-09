FROM python:3.8.3

WORKDIR /docs
RUN pip install --no-cache-dir tox
COPY . .

ENTRYPOINT ["tox"]
