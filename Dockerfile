FROM ubuntu:focal

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV WINEPREFIX /root/prefix64
ENV WINEARCH win64

ADD wineextradeps.sh /root/wineextradeps.sh

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get -y install gnupg2 wget && \
    echo "deb [arch=amd64] https://xpra.org/ focal main" > /etc/apt/sources.list.d/xpra.list && \
    wget -O - https://xpra.org/gpg.asc | apt-key add - && \
    apt-get update && apt-get -y install python2 python-is-python2 build-essential dpkg-dev libpulse0 xpra pulseaudio xdotool tar supervisor net-tools fluxbox mesa-utils && \
    wget -O - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -  && \
    echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' |tee /etc/apt/sources.list.d/winehq.list && \
    apt-get update && apt-get -y install winehq-stable && \
    chmod +x /root/wineextradeps.sh && /root/wineextradeps.sh "$(dpkg -s wine-stable | grep "^Version:\s" | awk '{print $2}' | sed -E 's/~.*$//')" && \
    apt-get -y full-upgrade && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD runner.sh /root/runner.sh
ADD paperwindow.sh /root/paperwindow.sh
ADD ./app /root/app

WORKDIR /root/
RUN chmod +x paperwindow.sh

EXPOSE 8080

CMD ["/root/paperwindow.sh"]
