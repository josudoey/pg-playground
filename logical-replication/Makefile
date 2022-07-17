
clean-data: clean-alice clean-bob

.PHONY: clean-alice
clean-alice:
	rm -r ./pg-alice/data

.PHONY: clean-bob
clean-bob:
	rm -r ./pg-bob/data

.PHONY: docker-clean
docker-clean: clean-data
	docker-compose rm pg-alice pg-bob -s -f
	docker rmi postgres14

.PHONY: build
build: dist/pglogical.tar

dist/pglogical.tar:
	docker build -t pglogical:latest ./docker/pglogical-builder/.
	mkdir -p tmp&&cd tmp&&docker save pglogical:latest |tar -zxvf -
	mkdir -p `dirname $@`
	mv tmp/*/layer.tar $@
	rm -r tmp