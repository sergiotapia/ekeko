deps:
	@nimble install -y --verbose

run:
	@nimble run ekeko

build:
	@nimble build -Y -d:ssl --threads:on --opt:size \
		-d:release --verbose src/ekeko.nim ekeko

test:
	@testament --targets:c cat .
	@find tests/ -type f ! -name "*.nim" -exec rm {} \;