NAME ?= pangolin
OUT = build

types = server client
type = $(word 1,$@)

all: ${types}

${types}:
	@cp ./cfg_${type}.json ./cfg.json
	GOOS=linux go build \
	     -trimpath \
	     -ldflags="-s -w -buildid=" \
	     -o ${OUT}/${NAME}_${type}
	@rm ./cfg.json

release: server
	@tar caf ${NAME}.tar.gz ${OUT}
	@rm -rf ${OUT}

clean:
	rm -rf ${OUT} ${NAME}*
