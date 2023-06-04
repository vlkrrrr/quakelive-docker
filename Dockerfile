FROM steamcmd/steamcmd:ubuntu-22 as builder
WORKDIR /tmp/ 
RUN steamcmd +force_install_dir /tmp/qlserver/ +login anonymous +app_update 349090 +quit 
RUN apt-get update && apt-get install git python3 python3-dev python3-pip
RUN git clone https://github.com/MinoMino/minqlx.git && cd minqlx && make
COPY /minqlx/bin /qlserver/
RUN cd /qlserver && git clone https://github.com/MinoMino/minqlx-plugins.git && cd minqlx-plugins && python3 -m pip install -r minqlx-plugins/requirements.txt

FROM ubuntu:22.10
RUN useradd --create-home --shell /bin/bash qladmin
USER qladmin
WORKDIR /home/qladmin
COPY --from=builder ./tmp/qlserver ./qlserver
COPY ./access.txt ./qlserver/
COPY ./startserver.sh ./qlserver/