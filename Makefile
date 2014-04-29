
SRC=src/main.cpp \
		src/header/header.cpp \
		src/header/navbar.cpp \
		src/main/index.cpp \
		src/about/index.cpp \
		src/gallery/index.cpp \
		src/gallery/image_widget.cpp \
		src/resume/index.cpp \
		src/misc/sidebar.cpp \
		src/misc/html_text.cpp

WARNING_FLAGS=-Wno-cpp

LD_FLAGS=-L/usr/local/lib \
    -lwthttp -lwt \
    -lboost_random -lboost_regex -lboost_signals -lboost_system \
		-lboost_thread -lboost_filesystem -lboost_program_options -lboost_date_time

.SILENT:
.PHONY: all debug run

all: setup debug

setup:
	mkdir -p bin

debug: $(SRC)
	c++ $(SRC) \
    -std=c++11 \
		-ggdb \
		-Wall -Wextra -pedantic \
    -Isrc/ \
    -I/usr/local/include \
		${WARNING_FLAGS} \
		${LD_FLAGS} \
    -o bin/a.out

run:
	sudo cgdb ./bin/a.out -ex "set args --docroot . --http-address 0.0.0.0 --http-port 80" -ex run
