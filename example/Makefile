go-build:
	@go build -buildmode=c-archive main.go
c-build:
	afl-clang-fast -o quic-go main.c http3/http3.a -lpthread
