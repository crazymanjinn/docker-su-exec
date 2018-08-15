FROM crazymanjinn/archlinux:devel as builder
RUN git clone https://aur.archlinux.org/su-exec.git && \
    cd su-exec && \
    makepkg -sf --noconfirm

FROM crazymanjinn/archlinux
COPY --from=builder /home/builduser/su-exec/su-exec-*-x86_64.pkg.tar.xz /tmp/pkgs/
