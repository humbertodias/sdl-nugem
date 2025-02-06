.PHONY: build

BUILD_TYPE=Debug
#BUILD_TYPE=Release
build:
	cmake -Bbuild -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
	cmake --build build

run:
	./build/nugem

clean:
	rm -rf build