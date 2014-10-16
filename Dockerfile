FROM    ubuntu:14.04 
MAINTAINER Yannick Saint Martino

RUN apt-get update -y && apt-get install -y wget libglib2.0-dev libx11-dev libgtk2.0-0

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/sublimeuser && \
    echo "sublimeuser:x:${uid}:${gid}:Developer,,,:/home/sublimeuser:/bin/bash" >> /etc/passwd && \
    echo "sublimeuser:x:${uid}:" >> /etc/group && \
    echo "sublimeuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sublimeuser && \
    chmod 0440 /etc/sudoers.d/sublimeuser && \
    chown ${uid}:${gid} -R /home/sublimeuser

RUN cd /home/sublimeuser/ 
RUN        wget http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3047_x64.tar.bz2 
RUN        tar vxjf sublime_text_3_build_3047_x64.tar.bz2 
RUN        rm sublime_text_3_build_3047_x64.tar.bz2 
RUN	mv sublime_text_3 /opt/ 
RUN	ln -s /opt/sublime_text_3/sublime_text /usr/bin/sublime

# share workspace directory
VOLUME ["/workspace"]

# launch
USER sublimeuser
ENV HOME /home/sublimeuser
CMD sublime 
