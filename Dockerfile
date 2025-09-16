FROM python:3.12

WORKDIR /app

RUN git clone https://github.com/FoundationAgents/OpenManus
WORKDIR /app/OpenManus

RUN pip install --no-cache-dir -r requirements.txt -c pillow>=10.4,<12

RUN playwright install
RUN playwright install-deps

CMD ["python", "main.py"]
# CMD ["bash"]
