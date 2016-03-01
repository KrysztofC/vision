all:
	rm -rf build/
	mkdir -p build/release
	mkdir -p build/debug
	
	rm -rf build/release
	mkdir build/release
	
	rm -rf bin/
	mkdir -p bin/utils
	mkdir -p bin/vision
	
	rm -rf lib/
	mkdir -p lib/utils
	mkdir -p lib/vision
	
	rm -rf lib/utils/*
	rm -rf lib/vision/*
	
	g++ -Wall -Werror -fPIC -c src/vision/image.cpp -I include/ -o lib/vision/image.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/image.a lib/vision/image.o
	g++ -shared lib/vision/image.o -o bin/vision/libimage.so
	
	
	g++ -Wall -Werror -fPIC -c src/utils/network.cpp -I include/ -o lib/utils/network.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/network.a lib/utils/network.o
	g++ -shared lib/utils/network.o -o bin/utils/libnetwork.so
	
	
	g++ -Wall -Werror -fPIC -c src/utils/logger.cpp -I include/ -o lib/utils/logger.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/logger.a lib/utils/logger.o
	g++ -shared lib/utils/logger.o -o bin/utils/liblogger.so

	
	g++ -Wall -Werror -fPIC -c src/utils/math.cpp -I include/ -o lib/utils/math.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/math.a lib/utils/math.o
	g++ -shared lib/utils/math.o -o bin/utils/libmath.so

	
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
	
	g++ -g -Wall -Werror -fPIC -c src/vision/image.cpp -I include/ -o lib/vision/imaged.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/imaged.a lib/vision/imaged.o
	g++ -shared lib/vision/imaged.o -o bin/vision/imaged.so
	
	g++ -g -Wall -Werror -fPIC -c src/utils/network.cpp -I include/ -o lib/utils/networkd.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/networkd.a lib/utils/networkd.o
	g++ -shared lib/utils/networkd.o -o bin/utils/libnetworkd.so
	
	g++ -g -Wall -Werror -fPIC -c src/utils/logger.cpp -I include/ -o lib/utils/loggerd.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/loggerd.a lib/utils/loggerd.o
	g++ -shared lib/utils/loggerd.o -o bin/utils/libloggerd.so
	
	g++ -g -Wall -Werror -fPIC -c src/utils/math.cpp -I include/ -o lib/utils/mathd.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/mathd.a lib/utils/mathd.o
	g++ -shared lib/utils/mathd.o -o bin/utils/libmathd.so
		
	g++ -g -Wall -Werror src/main.cpp -I include/ -o build/debug/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/loggerd.a lib/utils/mathd.a lib/utils/networkd.a lib/vision/imaged.a -DDEBUG -DBLUE -std=c++11
	
	rm lib/vision/imaged.o
	rm lib/utils/networkd.o
	rm lib/utils/loggerd.o
	rm lib/utils/mathd.o	

network:
	rm lib/utils/network.o
	rm lib/utils/network.a
	g++ -Wall -Werror -fPIC -c src/utils/network.cpp -I include/ -o lib/utils/network.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/network.a lib/utils/network.o
	g++ -shared lib/utils/network.o -o bin/utils/libnetwork.so
	g++ -Wall -Werror -fPIC -c src/utils/network.cpp -I include/ -o lib/utils/networkd.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -DDEBUG -std=c++11
	ar rcs lib/utils/networkd.a lib/utils/networkd.o
	g++ -shared lib/utils/networkd.o -o bin/utils/libnetworkd.so

math:
	rm lib/utils/math.o
	rm lib/utils/math.a
	g++ -Wall -Werror -fPIC -c src/utils/math.cpp -I include/ -o lib/utils/math.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/math.a lib/utils/math.o
	g++ -shared lib/utils/math.o -o bin/utils/libmath.so
	g++ -Wall -Werror -fPIC -c src/utils/math.cpp -I include/ -o lib/utils/mathd.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -DDEBUG -std=c++11
	ar rcs lib/utils/mathd.a lib/utils/mathd.o
	g++ -shared lib/utils/mathd.o -o bin/utils/libmathd.so
	
logger:
	rm lib/utils/logger.o
	rm lib/utils/logger.a
	g++ -Wall -Werror -fPIC -c src/utils/logger.cpp -I include/ -o lib/utils/logger.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/utils/logger.a lib/utils/logger.o
	g++ -shared lib/utils/logger.o -o bin/utils/liblogger.so
	g++ -Wall -Werror -fPIC -c src/utils/logger.cpp -I include/ -o lib/utils/loggerd.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -DDEBUG -std=c++11
	ar rcs lib/utils/loggerd.a lib/utils/loggerd.o
	g++ -shared lib/utils/loggerd.o -o bin/utils/libloggerd.so

image:
	rm lib/vision/image.o
	rm lib/vision/image.a
	g++ -Wall -Werror -fPIC -c src/vision/image.cpp -I include/ -o lib/vision/image.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -std=c++11
	ar rcs lib/vision/image.a lib/vision/image.o
	g++ -shared lib/vision/image.o -o bin/vision/libimage.so
	g++ -Wall -Werror -fPIC -c src/vision/image.cpp -I include/ -o lib/vision/imaged.o -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -DDEBUG -std=c++11
	ar rcs lib/vision/imaged.a lib/vision/imaged.o
	g++ -shared lib/vision/imaged.o -o bin/vision/libimaged.so

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
	g++ -g -Wall -Werror src/main.cpp -I include/ -o build/debug/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu lib/utils/loggerd.a lib/utils/mathd.a lib/utils/networkd.a lib/vision/imaged.a -DDEBUG -DRED -std=c++11

sharered:
	rm -rf build/release
	mkdir build/release
	g++ -Wall -Werror src/main.cpp -Lbin/utils -Lbin/vision -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -llogger -lnetwork -lmath -limage -DRED -std=c++11

shareblue:
	rm -rf build/release
	mkdir build/release
	g++ -Wall -Werror src/main.cpp -Lbin/utils -Lbin/vision -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -llogger -lnetwork -lmath -limage -DBLUE -std=c++11

sharegreen:
	rm -rf build/release
	mkdir build/release
	g++ -Wall -Werror src/main.cpp -Lbin/utils -Lbin/vision -I include/ -o build/release/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -llogger -lnetwork -lmath -limage -DGREEN -std=c++11
	
sharedebug:
	rm -rf build/debug
	mkdir build/debug
	g++ -g -Wall -Werror -Lbin/utils -Lbin/vision src/main.cpp -I include/ -o build/debug/Camera.out -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_gpu -lloggerd -lnetworkd -lmathd -limaged -DDEBUG -DRED -std=c++11
clean:
	rm -rf bin/utils/*
	rm -rf bin/vision/*
	rm -rf lib/utils/*
	rm -rf lib/vision/*
	rm -rf build/release/*
	rm -rf build/debug/*
	