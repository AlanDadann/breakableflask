FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
COPY database-requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir -r database-requirements.txt

COPY main.py .

RUN useradd -m appuser
USER appuser

EXPOSE 4000
CMD ["python", "main.py"]
