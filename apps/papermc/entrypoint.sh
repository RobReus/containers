#!/bin/bash

# Enter server directory
#cd papermc

# Update eula.txt with current setting
echo "eula=${EULA:-false}" > eula.txt

# Add RAM options to Java options if necessary
if [[ -n $MC_RAM ]]
then
  JAVA_FLAGS="-Xms${MC_RAM} -Xmx${MC_RAM} $JAVA_FLAGS"
fi

# Start server
exec java -server $JAVA_FLAGS -jar /papermc.jar $PAPERMC_FLAGS nogui
