FROM python:3-alpine 

RUN apk update && \
    apk upgrade && \
    apk add --no-cache libstdc++ && \
    apk add --no-cache --virtual=build_deps g++ gfortran && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install --no-cache-dir pandas && \
    rm /usr/include/xlocale.h && \
    apk del build_deps


COPY . /app
WORKDIR /app


CMD [ "python", "./script.py" ]

