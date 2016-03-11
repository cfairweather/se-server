# Space Engineers on Linux

FROM greyslater/space-engineers:01.124
MAINTAINER greyslater <christian@raab.cc>

######################### START  INSTALLATIONS ##########################

# Disable interaction from package installation during the docker image building.
ENV DEBIAN_FRONTEND noninteractive

# Delete previous SEDS and Download latest Space Engineers Dedicated Server
RUN rm -rf /home/root/.wine/drive_c/users/root/DedicatedServer && \
  cd /steamcmd && ./steamcmd.sh +login anonymous +force_install_dir /home/root/.wine/drive_c/users/root/DedicatedServer +app_update 298740 +quit

######################### END OF INSTALLATIONS ##########################

# Launching the server.
ENTRYPOINT ["/usr/local/bin/sigmap", "-m 15:2", "/usr/local/bin/space-engineers-server", "-noconsole"]
CMD [""]
