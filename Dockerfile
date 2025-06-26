FROM python:3.12 AS python-build
RUN pip install mysqlclient
RUN mkdir /app
WORKDIR /app
COPY requirements_base.txt /app/requirements_base.txt
RUN pip install --no-cache-dir -r requirements_base.txt

FROM python:3.12-slim
RUN mkdir /app

WORKDIR /app
COPY requirements.txt /app/requirements.txt

ENV TZ=America/Argentina/Buenos_Aires
COPY --from=python-build /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages


# default-libmysqlclient-dev   necesario para mysqlclient de python
# build-essential              necesario para mysqlclient de python 

#&&  apt-get install -y default-libmysqlclient-dev \

#RUN apt-get update \
#&&  apt-get install -y libcairo2-dev \
#&&  apt-get install -y libsdl-pango-dev \
#&&  apt-get clean

RUN pip install --no-cache-dir -r requirements.txt








