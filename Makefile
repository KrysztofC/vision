all:
	rm -rf build/release
	mkdir build/release
	
	rm -rf lib/utils/*
	rm -rf lib/vision/*
	
	g++ -Wall -Werror -c src/vision/image.cpp -I include/ -o lib/vision/image.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/image.a lib/vision/image.o
	
	g++ -Wall -Werror -c src/utils/network.cpp -I include/ -o lib/utils/network.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/network.a lib/utils/network.o
	
	g++ -Wall -Werror -c src/utils/logger.cpp -I include/ -o lib/utils/logger.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/logger.a lib/utils/logger.o
	
	g++ -Wall -Werror -c src/utils/math.cpp -I include/ -o lib/utils/math.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/math.a lib/utils/math.o
	
	g++ -Wall -Werror src/main.cpp -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DBLUE -std=c++11

	rm lib/vision/image.o
	rm lib/utils/network.o
	rm lib/utils/logger.o
	rm lib/utils/math.o	

	
alldebug:
	rm -rf build/debug
	mkdir build/debug
	
	rm -rf lib/utils/*
	rm -rf lib/vision/*
	
	g++ -g -Wall -Werror -c src/vision/image.cpp -I include/ -o lib/vision/image.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/image.a lib/vision/image.o
	
	g++ -g -Wall -Werror -c src/utils/network.cpp -I include/ -o lib/utils/network.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/network.a lib/utils/network.o
	
	g++ -g -Wall -Werror -c src/utils/logger.cpp -I include/ -o lib/utils/logger.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/logger.a lib/utils/logger.o
	
	g++ -g -Wall -Werror -c src/utils/math.cpp -I include/ -o lib/utils/math.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/math.a lib/utils/math.o
		
	g++ -g -Wall -Werror src/main.cpp -I include/ -o build/debug/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DDEBUG -DBLUE -std=c++11
	
	rm lib/vision/image.o
	rm lib/utils/network.o
	rm lib/utils/logger.o
	rm lib/utils/math.o	

	
allgreen:
	rm -rf build/release
	mkdir build/release
	
	rm -rf lib/utils/*
	rm -rf lib/vision/*
	
	g++ -Wall -Werror -c src/vision/image.cpp -I include/ -o lib/vision/image.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/image.a lib/vision/image.o
	
	g++ -Wall -Werror -c src/utils/network.cpp -I include/ -o lib/utils/network.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/network.a lib/utils/network.o
	
	g++ -Wall -Werror -c src/utils/logger.cpp -I include/ -o lib/utils/logger.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/logger.a lib/utils/logger.o
	
	g++ -Wall -Werror -c src/utils/math.cpp -I include/ -o lib/utils/math.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/math.a lib/utils/math.o
	
	g++ -Wall -Werror src/main.cpp -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DBLUE -std=c++11

	rm lib/vision/image.o
	rm lib/utils/network.o
	rm lib/utils/logger.o
	rm lib/utils/math.o
	
		
allred:
	rm -rf build/release
	mkdir build/release
	
	rm -rf lib/utils/*
	rm -rf lib/vision/*
	
	g++ -Wall -Werror -c src/vision/image.cpp -I include/ -o lib/vision/image.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/image.a lib/vision/image.o
	
	g++ -Wall -Werror -c src/utils/network.cpp -I include/ -o lib/utils/network.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/network.a lib/utils/network.o
	
	g++ -Wall -Werror -c src/utils/logger.cpp -I include/ -o lib/utils/logger.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/logger.a lib/utils/logger.o
	
	g++ -Wall -Werror -c src/utils/math.cpp -I include/ -o lib/utils/math.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/math.a lib/utils/math.o
	
	g++ -Wall -Werror src/main.cpp -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DBLUE -std=c++11
	
	rm lib/vision/image.o
	rm lib/utils/network.o
	rm lib/utils/logger.o
	rm lib/utils/math.o	
	

allblue:
	rm -rf build/release
	mkdir build/release
	
	rm -rf lib/utils/*
	rm -rf lib/vision/*
	
	g++ -Wall -Werror -c src/vision/image.cpp -I include/ -o lib/vision/image.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/image.a lib/vision/image.o
	
	g++ -Wall -Werror -c src/utils/network.cpp -I include/ -o lib/utils/network.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/network.a lib/utils/network.o
	
	g++ -Wall -Werror -c src/utils/logger.cpp -I include/ -o lib/utils/logger.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/logger.a lib/utils/logger.o
	
	g++ -Wall -Werror -c src/utils/math.cpp -I include/ -o lib/utils/math.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/math.a lib/utils/math.o	
	
	g++ -Wall -Werror src/main.cpp -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DBLUE -std=c++11
	
	rm lib/vision/image.o
	rm lib/utils/network.o
	rm lib/utils/logger.o
	rm lib/utils/math.o	
network:
	rm lib/utils/network.o
	rm lib/utils/network.a
	g++ -Wall -Werror -c src/utils/network.cpp -I include/ -o lib/utils/network.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/network.a lib/utils/network.o

math:
	rm lib/utils/math.o
	rm lib/utils/math.a
	g++ -Wall -Werror -c src/utils/math.cpp -I include/ -o lib/utils/math.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/math.a lib/utils/math.o
	
logger:
	rm lib/utils/logger.o
	rm lib/utils/logger.a
	g++ -Wall -Werror -c src/utils/logger.cpp -I include/ -o lib/utils/logger.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/logger.a lib/utils/logger.o

image:
	rm lib/vision/image.o
	rm lib/vision/image.a
	g++ -Wall -Werror -c src/vision/image.cpp -I include/ -o lib/vision/image.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/image.a lib/vision/image.o

camera:
	rm -rf build/release
	mkdir build/release
	g++ -Wall -Werror src/main.cpp -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DGREEN -std=c++11

red:
	rm -rf build/release
	mkdir build/release
	g++ -Wall -Werror src/main.cpp -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DRED -std=c++11

blue:
	rm -rf build/release
	mkdir build/release
	g++ -Wall -Werror src/main.cpp -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DBLUE -std=c++11

green:
	rm -rf build/release
	mkdir build/release
	g++ -Wall -Werror src/main.cpp -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DGREEN -std=c++11
	
debug:
	rm -rf build/debug
	mkdir build/debug
	g++ -g -Wall -Werror src/main.cpp -I include/ -o build/debug/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/logger.a lib/utils/math.a lib/utils/network.a lib/vision/image.a -DDEBUG -DBLUE -std=c++11
		
	