FROM mcr.microsoft.com/playwright/python:v1.51.0-jammy
WORKDIR /app

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/FoundationAgents/OpenManus
WORKDIR /app/OpenManus

RUN pip install --upgrade pip
RUN pip install --no-deps -r requirements.txt

CMD ["python", "main.py"]
