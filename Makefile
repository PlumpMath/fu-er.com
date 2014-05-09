
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
    -lwt \
    -lboost_random -lboost_regex -lboost_signals -lboost_system \
		-lboost_thread -lboost_filesystem -lboost_program_options -lboost_date_time

OUT=_

.SILENT:
.PHONY: all debug run

all: setup debug

setup:
	rm -f ${OUT}

debug: setup $(SRC)
	c++ $(SRC) \
    -std=c++11 \
		-ggdb \
		-Wall -Wextra -pedantic \
    -Isrc/ \
    -I/usr/local/include \
		${WARNING_FLAGS} \
		-lwthttp ${LD_FLAGS} \
    -o ${OUT}

release: setup $(SRC)
	c++ $(SRC) \
    -std=c++11 \
		-Wall -Wextra -pedantic \
		-O2 \
    -Isrc/ \
    -I/usr/local/include \
		${WARNING_FLAGS} \
		-lwtfcgi ${LD_FLAGS} \
    -o ${OUT}

run:
	./${OUT} --docroot . --http-address 0.0.0.0 --http-port 9091
spawn:
	spawn-fcgi -n -f ./${OUT} -a 0.0.0.0 -p 9091
