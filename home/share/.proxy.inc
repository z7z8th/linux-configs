export no_proxy=localhost,127.0.0.0/8,::1
export all_proxy=socks5://127.0.0.1:7070/
export http_proxy=socks5://127.0.0.1:7070/
export https_proxy=socks5://127.0.0.1:7070/
export HTTP_PROXY=socks5://127.0.0.1:7070/
export HTTPS_PROXY=socks5://127.0.0.1:7070/

git config --global http.proxy socks5h://127.0.0.1:7070
git config --global https.proxy socks5h://127.0.0.1:7070
