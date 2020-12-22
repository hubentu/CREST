FROM ubuntu:20.04

WORKDIR /opt
COPY . /opt/CREST/
RUN ln -s /opt/CREST/ptrfinder /usr/local/bin/

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y wget libbio-samtools-perl samtools gcc-multilib && apt-get clean

RUN wget http://seq.cs.iastate.edu/CAP3/cap3.linux.x86_64.tar && tar xvf cap3.linux.x86_64.tar && ln -s /opt/CAP3/cap3 /usr/local/bin/ && rm cap3.linux.x86_64.tar
RUN wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat -O /usr/local/bin/blat && chmod +x /usr/local/bin/blat
RUN wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/gfClient -O /usr/local/bin/gfClient && chmod +x /usr/local/bin/gfClient
RUN wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/gfServer -O /usr/local/bin/gfServer && chmod +x /usr/local/bin/gfServer
