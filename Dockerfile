FROM python:3.12-slim

RUN apt-get update && apt-get install -y git

WORKDIR /app

RUN git clone https://github.com/mannaandpoem/OpenManus.git
WORKDIR /app/OpenManus

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
# CMD ["bash"]