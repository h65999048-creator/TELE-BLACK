FROM python:3.10-slim

# Install Tor
RUN apt-get update && apt-get install -y tor && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Tor start hone ke liye 60 second wait karega, phir bot chalega
CMD ["sh", "-c", "tor & sleep 60 && python main.py"]
