FROM python:3.8-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

FROM python:3.8-slim

WORKDIR /app

COPY --from=builder /app .

EXPOSE 8080

CMD ["python", "app.py"]
