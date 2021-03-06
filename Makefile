all: lint gen

lint:
	@buf lint

gen: clean
	@buf generate

clean:
	@rm -rf pkg

breaking:
	@buf breaking --against "https://github.com/ebobo/buf_build_bsr_test/archive/main.zip#strip_components=1"

publish: breaking
	@buf push

init:
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@go install github.com/bufbuild/buf/cmd/buf@latest
