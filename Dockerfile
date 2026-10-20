FROM python:3.10-slim

# Install Tor
RUN apt-get update && apt-get install -y tor && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Tor ko background me start karo, 20 sec wait karo taaki connect ho jaye, phir bot start karo
CMD ["sh", "-c", "tor & sleep 20 && python main.py"]