FROM crazymanjinn/archlinux:devel as builder
RUN sudo -u nobody git clone https://aur.archlinux.org/su-exec.git && \
    cd su-exec && \
    sudo -u nobody makepkg -sf --noconfirm

FROM crazymanjinn/archlinux
COPY --from=builder /tmp/su-exec/su-exec-*-x86_64.pkg.tar.xz /tmp/pkgs/
COPY ./entrypoint.sh /tmp/pkgs
