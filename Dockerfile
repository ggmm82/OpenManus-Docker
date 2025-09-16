FROM ubuntu:20.04

# Installa Python 3.12, pip e dipendenze di base
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3.12-venv \
    python3-pip \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone https://github.com/ggmm82/OpenManus
WORKDIR /app/OpenManus

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install playwright
RUN playwright install
RUN playwright install-deps

CMD ["python3.12", "main.py"]
