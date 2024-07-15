.PHONY: all clean_firmware clean_image clean

all:
	docker build --tag zmk_corne --file Dockerfile .
	docker run --rm -it --name zmk_corne \
		-v $(PWD)/firmware:/app/firmware \
		-v $(PWD)/config:/app/config:ro \
		zmk_corne

clean_firmware:
	rm -f $(PWD)/firmware/*.uf2

clean_image:
	docker image rm zmk_corne docker.io/zmkfirmware/zmk-build-arm:stable

clean:
	clean_firmware
	clean_image