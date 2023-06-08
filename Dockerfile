FROM steamcmd/steamcmd:ubuntu-22 as builder
WORKDIR /tmp/ 
RUN steamcmd +force_install_dir /tmp/qlserver/ +login anonymous +app_update 349090 +quit 
RUN apt-get -y update && apt-get -y install git python3 python3-dev python3-pip
RUN pip install poetry
RUN poetry --version
RUN git clone https://github.com/MinoMino/minqlx.git && cd minqlx && make
RUN ls -l
RUN cp -r minqlx/bin/ qlserver/
RUN cd qlserver && git clone https://github.com/vlkrrrr/minqlx-plugins.git
RUN cd qlserver && cd minqlx-plugins && poetry install --no-root

FROM ubuntu:22.10
RUN useradd --create-home --shell /bin/bash qladmin
USER qladmin
WORKDIR /home/qladmin
COPY --from=builder ./tmp/qlserver ./qlserver
COPY ./access.txt ./qlserver/
COPY ./startserver.sh ./qlserver/