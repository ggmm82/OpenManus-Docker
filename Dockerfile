FROM python:3.12-slim

RUN apt-get update && apt-get install -y git

# Imposta la cartella di lavoro
WORKDIR /app

# Clona il repository
RUN git clone https://github.com/ggmm82/OpenManus
WORKDIR /app/OpenManus

# Installa i requisiti Python
RUN pip install --no-cache-dir -r requirements.txt

# Avvio dell'applicazione
CMD ["sh", "-c", "echo 'Debug mode - Listening on port 3000' && nc -l -p 3000 -k"]
