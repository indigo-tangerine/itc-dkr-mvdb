FROM python:3.9-slim
LABEL Author="Rupert Broad - ITC"

ENV APP_DIR=/mvdb
WORKDIR $APP_DIR

RUN apt update \
  && apt install -y jq curl 

# Install requirements
COPY requirements.txt ./
RUN python3 -m pip install --upgrade pip \
  && python3 -m pip install -r requirements.txt 

# Copy api code
COPY ./src $APP_DIR/

EXPOSE 5000

CMD ["python3", "server.py"]
