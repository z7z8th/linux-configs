# Line commented out by installer because it failed to verify:
#deb [arch=amd64,i386] http://security.debian.org/ squeeze/updates main
# Line commented out by installer because it failed to verify:
#deb-src http://security.debian.org/ squeeze/updates main

deb http://mirrors.163.com/debian proposed-updates main contrib non-free

deb http://mirrors.163.com/debian stable main contrib non-free
deb http://mirrors.163.com/debian stable-updates main contrib non-free
deb http://mirrors.163.com/debian squeeze-proposed-updates main contrib non-free
deb http://mirrors.163.com/debian-backports squeeze-backports main contrib non-free

deb http://mirrors.163.com/debian testing main contrib non-free
deb http://mirrors.163.com/debian testing-updates main contrib non-free
deb http://mirrors.163.com/debian testing-proposed-updates main contrib non-free

deb http://mirrors.163.com/debian unstable main contrib non-free
deb http://mirrors.163.com/debian experimental main contrib non-free

deb http://mirrors.163.com/debian-security testing/updates main contrib non-free
deb http://mirrors.163.com/debian-security stable/updates main contrib non-free



############ source settings ############

deb-src http://mirrors.163.com/debian testing main contrib non-free



# backup for multiarch:
# deb [arch=amd64,i386] http://xxx.xxx.xxx/xxxx testing main
