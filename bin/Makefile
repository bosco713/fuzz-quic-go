run:
	@afl-fuzz -m 4G -d -i input -o output -N tcp://127.0.0.1/6121 -P TLS -D 10000 -q 3 -K -R ./quic-go -tcp -key priv.key -cert cert.pem

showmap:
	@afl-showmap -m 4G -o map.txt ./quic-go -tcp -key priv.key -cert cert.pem
