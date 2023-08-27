FROM python:3.10-bookworm

ENV PYTHONPATH=/opt/seedsigner/src

COPY requirements.txt pytest.ini /opt/seedsigner/
COPY src/ /opt/seedsigner/src/
COPY tests/ /opt/seedsigner/tests/

WORKDIR /opt/seedsigner/
RUN pip3 install -r requirements.txt \
    && pip3 install -r tests/requirements.txt \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -yq install libzbar0 
