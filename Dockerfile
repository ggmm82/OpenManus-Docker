FROM python:3.12

# Aggiorno e installo git
RUN apt-get update && apt-get install -y git

# Aggiorno pip
RUN pip install --upgrade pip

WORKDIR /app

# Clono il repo
RUN git clone https://github.com/FoundationAgents/OpenManus
WORKDIR /app/OpenManus

# >>> Fix dipendenze
# Installo manualmente le versioni compatibili
RUN pip install "pillow==10.4.0" "crawl4ai==0.6.3"

# Installo browser-use da GitHub (non è su PyPI)
RUN pip install "git+https://github.com/FoundationAgents/browser-use.git@0.1.40"

# Ora installo il resto dei requirements senza ricalcolare le deps
RUN pip install --no-deps -r requirements.txt
# <<<

# Installo Playwright + dipendenze
RUN playwright install
# Se serve anche headless deps (su Debian moderno meglio evitare "install-deps")
RUN apt-get update && apt-get install -y \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgtk-3-0 \
    libnss3 \
    fonts-liberation \
    libjpeg62-turbo \
    libicu72 \
    && rm -rf /var/lib/apt/lists/*

CMD ["python", "main.py"]
