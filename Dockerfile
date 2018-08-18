FROM crazymanjinn/archlinux:devel as builder
COPY ./entrypoint.sh /su-exec/
RUN sudo -u nobody git clone https://aur.archlinux.org/su-exec.git && \
    cd su-exec && \
    sudo -u nobody makepkg -sf --noconfirm && \
    mv su-exec-*-x86_64.pkg.tar.xz /su-exec

FROM scratch
COPY --from=builder /su-exec /su-exec
