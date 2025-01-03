default: pre build post

 all: pre build build-darwin build-windows build-linux build-freebsd build-loong64 post

 pre:
	autotag write

 build:
	mkdir -p bin
	go build -o bin/hf-model-path

 build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o hf-model-path_`autotag current`_linux_arm64
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o hf-model-path_`autotag current`_linux_amd64
	CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -o hf-model-path_`autotag current`_linux_386

build-freebsd:
	CGO_ENABLED=0 GOOS=freebsd GOARCH=arm64 go build -o hf-model-path_`autotag current`_freebsd_arm64
	CGO_ENABLED=0 GOOS=freebsd GOARCH=amd64 go build -o hf-model-path_`autotag current`_freebsd_amd64
	CGO_ENABLED=0 GOOS=freebsd GOARCH=386 go build -o hf-model-path_`autotag current`_freebsd_386

 build-loong64:
 	
	CGO_ENABLED=0 GOOS=linux GOARCH=loong64 go build -o hf-model-path_`autotag current`_linux.loong64
	CGO_ENABLED=0 GOOS=linux GOARCH=mipsle go build -o hf-model-path_`autotag current`_linux.mipsle
	CGO_ENABLED=0 GOOS=linux GOARCH=mips64le go build -o hf-model-path_`autotag current`_linux.mips64le
 	

 build-darwin:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o hf-model-path_`autotag current`_darwin_amd64
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -o hf-model-path_`autotag current`_darwin_arm64

 build-windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o hf-model-path_`autotag current`_windows_amd64.exe
	CGO_ENABLED=0 GOOS=windows GOARCH=386 go build -o hf-model-path_`autotag current`_windows_386.exe
	CGO_ENABLED=0 GOOS=windows GOARCH=arm64 go build -o hf-model-path_`autotag current`_windows_arm64.exe

 post:
	git restore autotag.go

 clean:
	rm -rf hf-model-path_*.* bin