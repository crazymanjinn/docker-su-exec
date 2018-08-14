FROM crazymanjinn/archlinux:devel

RUN git clone https://aur.archlinux.org/su-exec.git && \
    cd su-exec && \
    makepkg -sf --noconfirm
