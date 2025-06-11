extract:
	./tinycore-extract.sh

repack:
	rm -f out.iso
	./tinycore-repack.sh out.iso
	isohybrid out.iso

update-zig-matrix:
	rm -f core/zig-matrix
	cp ~/projects/zig-matrix/zig-out/bin/zig-matrix core/zig-matrix

update-zig-haxor-screen:
	rm -f core/zig-haxor-screen
	cp ~/projects/zig-haxor-screen/zig-out/bin/zig-haxor-screen core/zig-haxor-screen

update: update-zig-haxor-screen update-zig-matrix
