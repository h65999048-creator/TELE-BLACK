FROM python:3.10-slim

# Tor install kar
RUN apt-get update && apt-get install -y tor && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Tor ko pura 60 second do connect hone ke liye, phir bot start karo
CMD ["sh", "-c", "tor & sleep 60 && python main.py"]
