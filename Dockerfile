FROM amazonlinux

WORKDIR /app

COPY requirements.txt .

RUN python3 -m venv .venv
RUN .venv/bin/pip3 install -r requirements.txt

COPY app.py .
COPY testServer.py .
COPY pullrequest.py .

CMD [".venv/bin/gunicorn", "--bind", "0.0.0.0:80", "app:app"]
