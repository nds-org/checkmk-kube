FROM progrium/busybox

RUN opkg-install procps bash curl xinetd && \
    curl -k -L https://github.com/markocelan/docker-check_mk/raw/master/files/check-mk-agent_1.2.2p3-2_all.tgz | gunzip | tar -xpC /  && \
    curl -k -L https://github.com/craig-willis/check_kube/releases/download/v0.2/check_kube-linux-amd64 -o /usr/bin/check_kube && \
    chmod +x /usr/bin/check_kube

COPY scripts/* /usr/lib/check_mk_agent/local/

ENTRYPOINT [ "/usr/sbin/xinetd", "-f", "/etc/xinetd.conf", "-dontfork", "-stayalive" ]
