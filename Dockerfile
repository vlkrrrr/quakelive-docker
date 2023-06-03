FROM steamcmd/steamcmd:ubuntu-22 as builder
WORKDIR /tmp/ 
RUN steamcmd +force_install_dir /tmp/qlserver/ +login anonymous +app_update 349090 +quit 
RUN ls -l

FROM ubuntu:22.10
COPY --from=builder ./tmp/qlserver ./var/qlserver
COPY ./access.txt ./var/qlserver/
COPY ./startserver.sh ./var/qlserver/