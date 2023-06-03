FROM steamcmd/steamcmd:ubuntu-22 as builder
RUN ./steamcmd.sh +login anonymous +force_install_dir ./steamapps/common/qlds/ +app_update 349090 +quit 

FROM ubuntu:22.10
COPY --from=builder ./steamapps/common/qlds/ ./steamapps/common/qlds/ 