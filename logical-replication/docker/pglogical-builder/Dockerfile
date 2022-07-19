FROM debian:bullseye-slim as builder
RUN apt update && apt install -y gnupg wget
RUN echo "deb http://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" |tee /etc/apt/sources.list.d/pgdg.list 
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt update && apt install -y build-essential postgresql-server-dev-14 \
    libkrb5-dev libselinux-dev libxslt-dev libpam-dev zlib1g-dev liblz4-dev

RUN wget https://github.com/2ndQuadrant/pglogical/archive/refs/tags/REL2_4_1.tar.gz
RUN tar -zxvf REL2_4_1.tar.gz
ADD pglogical.patch /tmp/pglogical.patch
RUN cd pglogical-REL2_4_1 && patch < /tmp/pglogical.patch
RUN cd pglogical-REL2_4_1 && make && make install DESTDIR=/tmp/dist

FROM scratch as pglogical
COPY --from=builder /tmp/dist /
