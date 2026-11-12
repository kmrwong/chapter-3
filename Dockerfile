FROM python:3.10-slim-bookworm
WORKDIR /app 

COPY requirements.txt /app/requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

COPY main.py entrypoint.sh /app/

EXPOSE 8083
ENV PYTHONPATH="/app"

RUN chmod +x /app/entrypoint.sh 
ENTRYPOINT ["/app/entrypoint.sh"]
