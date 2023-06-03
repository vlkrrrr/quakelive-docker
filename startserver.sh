#!/bin/bash
gameport=`expr $1 + 27960`
rconport=`expr $1 + 28960`
servernum=`expr $1 + 1`

exec /home/quake/steamcmd/steamapps/common/qlds/run_server_x86.sh \
+set net_strict 1 \
+set net_port $gameport \
+set sv_hostname "My Quake Live Server #$servernum" \
+set fs_homepath /home/user/.quakelive/$gameport \
+set zmq_rcon_enable 1 \
+set zmq_rcon_password "mypass" \
+set zmq_rcon_port $rconport \
+set zmq_stats_enable 1 \
+set zmq_stats_password "mypass" \
+set zmq_stats_port $gameport