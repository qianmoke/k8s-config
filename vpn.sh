modprobe af_key
docker run \
    --name ipsec-vpn-server \
    -e VPN_USER=k2 \
    -e VPN_IPSEC_PSK=woyaovpn \
    -e VPN_PASSWORD=K2data1234 \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server
