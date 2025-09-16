FROM python:3.12

RUN apt-get update && apt-get install -y git

RUN pip install --upgrade pip

WORKDIR /app

RUN git clone https://github.com/FoundationAgents/OpenManus
WORKDIR /app/OpenManus

RUN pip install "pillow==10.4.0" "crawl4ai==0.6.3"
RUN pip install --no-deps -r requirements.txt

RUN playwright install
RUN playwright install-deps

CMD ["python", "main.py"]
# CMD ["bash"]
