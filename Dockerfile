FROM python:3.10-slim

# Install Tor
RUN apt-get update && apt-get install -y tor && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Start script (Tor aur bot dono chalane ke liye)
RUN echo '#!/bin/bash\n\
tor &\n\
sleep 10\n\
python main.py' > start.sh && chmod +x start.sh

CMD ["./start.sh"]