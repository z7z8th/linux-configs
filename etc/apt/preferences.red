Package: *
Pin: release a=testing
Pin-Priority: 990

Package: *
Pin: release a=stable-backports
Pin-Priority: 800

Package: *
Pin: release n=squeeze-backports
Pin-Priority: 800

Package: *
Pin: release a=unstable
Pin-Priority: 400


Package: *iceweasel* *icedove* *iceowl* xul-ext* calendar-timezones
Pin: release n=experimental
Pin-Priority: 999

Package: xserver-xorg*
Pin: release n=squeeze-backports
Pin-Priority: 990

Package: libgl1-mesa-dri
Pin: release n=squeeze-backports
Pin-Priority: 990

Package: fglrx-driver *fglrx*
Pin: release n=squeeze-backports
Pin-Priority: 990