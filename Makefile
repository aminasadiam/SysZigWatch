build:
	@zig build

run: build
	@zig-out/bin/SysZigWatch.exe