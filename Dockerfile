# Usa l'immagine ufficiale Python 3.12 (inclusi pip e venv)
FROM python:3.12-slim

# Imposta la cartella di lavoro
WORKDIR /app

# Installa strumenti di base e dipendenze necessarie per Playwright
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    libnss3 \
    libnspr4 \
    libdbus-1-3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libxkbcommon0 \
    libasound2 \
    libatspi2.0-0 \
    libgdk-pixbuf-xlib-2.0-0 \
    fonts-unifont \
 && rm -rf /var/lib/apt/lists/*

# Clona il repository
RUN git clone https://github.com/ggmm82/OpenManus
WORKDIR /app/OpenManus

# Installa i requisiti Python
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir playwright

# Installa i browser di Playwright
RUN playwright install

# Avvio dell'applicazione
CMD ["python", "run_mcp.py"]
