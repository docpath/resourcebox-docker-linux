FROM mbe1224/debian-oracle-java:stretch-slim-jdk8

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y lib32stdc++6 gcc-multilib procps
RUN mkdir /required_files
COPY resourcebox-windows-linux-installer-2.x.y.jar /required_files/
WORKDIR /required_files
RUN java -jar resourcebox-windows-linux-installer-2.x.y.jar -solname"ResourceBox Service" -install -solution"/usr/local/docpath/resourcebox" -silentmode -console -licserverpath"/usr/local/docpath/licenseserver" -licserverport1765
COPY DocPath_License_File.lic /usr/local/docpath/Licenses/
COPY run.sh /usr/local/bin/
WORKDIR /
RUN rm -rf /required_files
EXPOSE 1791

ENTRYPOINT ["/usr/local/bin/run.sh"]

