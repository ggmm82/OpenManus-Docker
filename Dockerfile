FROM python:3.12-slim

RUN apt-get update && apt-get install -y git

# Imposta la cartella di lavoro
WORKDIR /app

# Clona il repository
RUN git clone https://github.com/ggmm82/OpenManus
WORKDIR /app/OpenManus

# Installa i requisiti Python
RUN pip install --no-cache-dir -r requirements.txt

# Esponi la porta
EXPOSE 3000

# Avvia server HTTP semplice
CMD ["python", "-m", "http.server", "3000", "--bind", "0.0.0.0"]
