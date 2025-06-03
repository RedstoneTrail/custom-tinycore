extract:
	./tinycore-extract.sh

repack:
	rm -f out.iso
	./tinycore-repack.sh out.iso
	isohybrid out.iso
