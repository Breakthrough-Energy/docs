FROM python:3.8.3

WORKDIR /docs
RUN pip install --no-cache-dir --upgrade pip tox
COPY . .

ENTRYPOINT ["tox", "-p", "auto", "-o"]
