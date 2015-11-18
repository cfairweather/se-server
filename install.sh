#!/usr/bin/env bash

# wine
wine_home="/home/root/.wine/drive_c/users/root"
wine_appdata="${wine_home}/Application Data"

# space engineers
se_home="${wine_home}/DedicatedServer"
se_appdata="${wine_appdata}/SpaceEngineersDedicated"

# entry point
entry_point="/usr/local/bin/space-engineers-server"

# installation
cat << EOF > ${entry_point}
#!/usr/bin/env bash

mkdir -p "${wine_appdata}"
ln -s "/host" "${se_appdata}"

# Set up a new server if no files where provided
mkdir -p /host/docker /host/data /host/data/Mods /host/data/Saves 
yes n | cp -i /home/root/SpaceEngineers-Dedicated.cfg /host/ && echo

exec wine "${se_home}/DedicatedServer/SpaceEngineersDedicated.exe" "\$@"

EOF

chmod u+x "${entry_point}"

