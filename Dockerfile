FROM python:3.13.0a3-slim
LABEL Author="Rupert Broad ITC"

ENV APP_DIR=/mvdb
WORKDIR $APP_DIR

RUN apt-get update \
  && apt-get install -y --no-install-recommends jq curl 

# Install requirements
COPY requirements.txt ./
RUN python3 -m pip install --no-cache-dir --upgrade pip \
  && python3 -m pip install -r requirements.txt --no-cache-dir

# Copy api code
COPY ./src $APP_DIR/

EXPOSE 5000

CMD ["python3", "server.py"]
