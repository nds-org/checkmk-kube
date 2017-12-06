FROM progrium/busybox

RUN opkg-install procps bash  coreutils-stat  curl xinetd && \
    curl -k -L https://github.com/markocelan/docker-check_mk/raw/master/files/check-mk-agent_1.2.2p3-2_all.tgz | gunzip | tar -xpC /  && \
    curl -k -L https://github.com/craig-willis/check_kube/releases/download/v0.2/check_kube-linux-amd64 -o /usr/bin/check_kube && \
    chmod +x /usr/bin/check_kube

COPY check_mk/etc /etc/
COPY check_mk/usr /usr/
COPY scripts /scripts
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT "/entrypoint.sh"
