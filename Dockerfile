FROM python:3.9-slim-bullseye

RUN mkdir /app && chmod 777 /app
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive

# update + install only required packages, clean apt lists to keep image small
RUN apt-get -qq update \
 && apt-get -qq install -y --no-install-recommends git ffmpeg \
 && rm -rf /var/lib/apt/lists/*

COPY . /app
RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["python3", "main.py"]
