FROM python:3.10-slim

# Install Tor
RUN apt-get update && apt-get install -y tor && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# 45 second wait karega taaki Tor pura connect ho jaye
CMD ["sh", "-c", "tor & sleep 45 && python main.py"]