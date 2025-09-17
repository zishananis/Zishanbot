# Don't Remove Credit @DigitalGalaxyHQ
# Ask Doubt on telegram @Spider_Man_02
FROM python:3.10.8-slim-buster

# Use archive.debian.org to fix 404 errors
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i '/security.debian.org/d' /etc/apt/sources.list \
    && apt update && apt upgrade -y \
    && apt install git -y

COPY requirements.txt /requirements.txt

RUN cd / \
    && pip3 install -U pip \
    && pip3 install -U -r requirements.txt

RUN mkdir /Auto-FILTER-BOT
WORKDIR /Auto-FILTER-BOT
COPY . /Auto-FILTER-BOT

CMD ["python", "bot.py"]
