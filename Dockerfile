FROM python:3.8-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY app.py .

FROM python:3.8-slim

WORKDIR /app

COPY --from=builder /app .

EXPOSE 8080

CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0"]
