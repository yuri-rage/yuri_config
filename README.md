##yuri_config - Yuri's Linux configuration files##

My collection of Linux configuration files, stored here primarily for personal use.

Feel free to copy/clone them for your own use.  I make no promises that they'll work on your system.

--Yuri

#####RELEASE NOTES:#####
    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
    Version 2, December 2004

    Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.

    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

    0. You just DO WHAT THE FUCK YOU WANT TO.

---------------------------------------------
<!--- cut_here --->
System info current as of: Fri, 06 Jun 2014  21:08:00

Output of `uname -a >> README.md` :

    Linux vorlauf-arch 3.14.5-1-ARCH #1 SMP PREEMPT Sun Jun 1 07:36:23 CEST 2014 x86_64 GNU/Linux

Output of `pacman -Qe >> README.md` :<br>
(all explicitly installed Arch packages)

    accountsservice 0.6.37-1
    acpi 1.7-1
    alsa-utils 1.0.27.2-1
    archey 20130324-7
    astyle 2.04-2
    autoconf 2.69-1
    automake 1.14.1-1
    bash 4.3.018-1
    binutils 2.24-4
    bison 3.0.2-1
    bzip2 1.0.6-5
    catfish 1.0.2-1
    chromium 35.0.1916.114-1
    chromium-libpdf 1:35.0.1916.114-1
    chromium-pepper-flash 13.0.0.214-2
    compton-git 0.1_beta2.29.gbb55706-1
    conky-lua 1.9.0-2
    coreutils 8.22-4
    cryptsetup 1.6.4-1
    device-mapper 2.02.106-2
    dhcpcd 6.3.2-1
    dialog 1:1.2_20140219-1
    diffutils 3.3-1
    e2fsprogs 1.42.10-1
    faenza-crunchbang-icon-theme 1.2-2
    faenza-icon-theme 1.3.1-2
    fakeroot 1.20-1
    fdupes 1.51-2
    feh 2.12-1
    file 5.18-1
    filesystem 2014.05-2
    findutils 4.4.2-5
    flex 2.5.39-1
    gawk 4.1.1-1
    gcc 4.9.0-3
    gcc-libs 4.9.0-3
    gettext 0.18.3.2-1
    gimp 2.8.10-1
    glibc 2.19-5
    gmrun 0.9.2-4
    gnome-themes-standard 3.12.0-1
    grep 2.19-1
    groff 1.22.2-6
    grub 1:2.02.beta2-4
    gstreamer0.10-bad-plugins 0.10.23-8
    gstreamer0.10-good-plugins 0.10.31-6
    gstreamer0.10-ugly-plugins 0.10.19-11
    gvim 7.4.307-4
    gzip 1.6-1
    hsetroot 1.0.2-2
    inetutils 1.9.2-1
    iproute2 3.14.0-1
    iputils 20121221-3
    iw 3.14-1
    jfsutils 1.1.15-4
    less 458-1
    libtool 2.4.2-13
    libutil-linux 2.24.2-1
    licenses 20130203-1
    lightdm 1:1.10.1-2
    lightdm-gtk-greeter-settings 1.0-1
    lightdm-gtk3-greeter-devel 1.8.5-2
    linux 3.14.5-1
    logrotate 3.8.7-3
    lvm2 2.02.106-2
    lxappearance-obconf 0.2.1-2
    m4 1.4.17-1
    make 4.0-2
    man-db 2.6.7.1-1
    man-pages 3.68-1
    mdadm 3.3-2
    mediterraneannight-theme-git 2.03.0.1.r9.g2c41b16-1
    mesa 10.1.4-1
    mlocate 0.26-3
    mp3gain 1.5.2-3
    nano 2.2.6-2
    network-manager-applet 0.9.8.10-1
    networkmanager 0.9.8.10-1
    nodejs 0.10.28-3
    obconf 2.0.4-1
    oblogout 0.2-15
    obmenu 1.0-9
    openbox 3.5.2-6
    openbox-themes 1.0.2-2
    os-prober 1.58-1
    packer 20140103-1
    pacman 4.1.2-6
    patch 2.7.1-2
    pciutils 3.2.1-1
    pcmciautils 018-7
    perl 5.20.0-2
    pkg-config 0.28-1
    procps-ng 3.3.9-3
    psmisc 22.21-2
    python-gobject 3.12.2-1
    python2-xlib 0.15rc1-7
    reiserfsprogs 3.6.24-1
    rxvt-unicode-pixbuf 9.20-1
    s-nail 14.6.4-1
    screen 4.2.1-2
    scrot 0.8-6
    sed 4.2.2-3
    shadow 4.2.1-1
    sudo 1.8.10.p3-1
    sysfsutils 2.1.0-8
    systemd-sysvcompat 213-5
    tar 1.27.1-1
    terminus-font 4.39-1
    texinfo 5.2-2
    thunar 1.6.3-1
    tint2-svn 652-4
    ttf-dejavu 2.34-1
    ttf-google-fonts-git 20140512-1
    ttf-mac-fonts 1-7
    ttf-microsoft-consolas 5.33-1
    ttf-ms-fonts 2.0-10
    udiskie 0.8.0-2
    urxvt-perls 2.1-1
    urxvt-vtwheel 0.3-1
    usbutils 007-1
    util-linux 2.24.2-1
    vi 1:050325-3
    vlc 2.1.4-2
    volumeicon 0.5.0-2
    waldorf-ui-theme 0.07-1
    wget 1.15-1
    which 2.20-6
    wmctrl 1.07-3
    wpa_supplicant 2.1-3
    xbmc 13.0-6
    xclip 0.12-3
    xcursor-vanilla-dmz 0.4.4-1
    xf86-video-intel 2.99.911-2
    xfburn 0.5.2-1
    xfce4-notifyd 0.2.4-1
    xfsprogs 3.1.11-2
    xorg-server 1.15.1-1
    xorg-server-utils 7.6-3
    xorg-twm 1.0.8-1
    xorg-utils 7.6-8
    xorg-xclock 1.0.7-1
    xorg-xinit 1.3.3-3
    xsel 1.2.0-5
    xterm 304-1
    youtube-dl 2014.06.04-1
