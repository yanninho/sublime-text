FROM    ubuntu:14.04
MAINTAINER Yannick Saint Martino

RUN apt-get update -y && apt-get install -y wget libglib2.0-dev libx11-dev libgtk2.0-0

# Set locale to UTF8
RUN locale-gen --no-purge en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN dpkg-reconfigure locales
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8


RUN export uid=1000 gid=1000 && \
    mkdir -p /home/sublimeuser && \
    echo "sublimeuser:x:${uid}:${gid}:Developer,,,:/home/sublimeuser:/bin/bash" >> /etc/passwd && \
    echo "sublimeuser:x:${uid}:" >> /etc/group && \
    echo "sublimeuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sublimeuser && \
    chmod 0440 /etc/sudoers.d/sublimeuser && \
    chown ${uid}:${gid} -R /home/sublimeuser

RUN cd /home/sublimeuser/
RUN        wget http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3065_x64.tar.bz2
RUN        tar vxjf sublime_text_3_build_3065_x64.tar.bz2
RUN        rm sublime_text_3_build_3065_x64.tar.bz2
RUN	mv sublime_text_3 /opt/
RUN	ln -s /opt/sublime_text_3/sublime_text /usr/bin/sublime

RUN mkdir -p '/home/sublimeuser/.config/sublime-text-3/Packages'
RUN mkdir -p '/home/sublimeuser/.config/sublime-text-3/Installed Packages' && cd '/home/sublimeuser/.config/sublime-text-3/Installed Packages'
RUN wget https://sublime.wbond.net/Package%20Control.sublime-package
RUN mv 'Package Control.sublime-package' '/home/sublimeuser/.config/sublime-text-3/Installed Packages/'


# share workspace directory
VOLUME ["/workspace"]

# launch
USER sublimeuser
CMD sublime
