#include <opencv2/opencv.hpp>
#include <opencv2/opencv_modules.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/video/video.hpp>
#include <iostream>
#include <fstream>
#include <cmath>
#include <vector>
//Local files
#include "VisualUtils.h"
#include "errorList.h"



using namespace cv;
using namespace std;

int image(string LOCATION);
int camera();

int main(int argc, char *argv[]) {	
	if (argc <= 1) 
		return camera();
    	else if (argc > 1) 
	   	return image(argv[1]);
    	else 
		cerr << "Error! Invalid Input!" << endl;
}


int camera() {
initModule_features2d();

        bool die = false;
string filename("snapshot");
	string suffix(".png");
	int i_snap(0), iter(0);
        vector < vector <Point> > contours;
        vector<Rect > boundRect;
        Mat frame(Size(480, 360), CV_8UC3, Scalar(0));
        VideoCapture cap ("http://root:1425@10.14.25.17/mjpg/video.mjpg?dummy=video.mjpg");

        if (!cap.isOpened())
        {
            cout <<"Cannot open the Axis Cam" << endl;
            return -1;
        }
        namedWindow("Output", CV_WINDOW_AUTOSIZE);
	cout << "Camera opened Successfully" << endl;
        while (die == false) {
		cout << frame.size() << endl;
            bool rSuccess = cap.read(frame);
            if (!rSuccess)
            {
                cout << "Cannot Read Frame" << endl;
                return -1;
            }
	    cout << "Frame Successfully Read" << endl;
            imshow("Output", frame);

            //Matrixes to be converted or modified
            Mat HSVMat(Size(480, 360), CV_8UC3, Scalar (0));
            Mat PostFrame(Size(480, 360), CV_8UC3, Scalar (0));
            Mat PostFrame2(Size(640, 400), CV_8UC3, Scalar (0));

            //Set up the images for processing
            frame.copyTo(PostFrame);
            frame.copyTo(HSVMat);
            cvtColor(HSVMat, HSVMat, CV_RGB2HSV);
		cout << "Mats Copied to" << endl;
            //Define variables to be used in the thresholding process
            Mat HSVMin(Size(480, 360), CV_8UC3, Scalar (0, 230, 0));
            Mat HSVMax(Size(480, 360), CV_8UC3, Scalar (255, 255, 255));
            Mat ThreshMat(Size(480, 360), CV_8U, Scalar(0));

            //Begin the Processing
            Threshold(ThreshMat, HSVMin, HSVMax, frame);
            contours = edgeDetect(ThreshMat, Scalar(0, 255, 0), PostFrame);
            boundRect = ShowTargets(contours, PostFrame);
 		imshow ("Output", PostFrame);
		cout << "Processing Done" << endl;
           PostFrame2 = getLeftRight(PostFrame, 0.5, 30, Scalar(0,255,0), 1, boundRect);
	imshow ("Output2", PostFrame2);
           char k = cvWaitKey(5);
		if (k == 8) {
			std::ostringstream file;
			file << filename << i_snap << suffix;
			cv::imwrite(file.str(), frame);
			i_snap++;
		}
		if (iter >= 100000000)
			break;
		iter++;

            }
   return 0;     

    
}

int image(string LOCATION) {
	if (LOCATION.size() == 0) {
		cerr << "ERROR! NO LOCATION PROVIDED!" << endl;
		exit (1);		
	}	
     	initModule_features2d();
        bool finishedLoop = false;
        int i_snap(0);
        bool die = false;
        string filename("snapshot");
        string suffix(".png");
        vector < vector <Point> > contours;
        vector<Rect > boundRect;
        Mat frame(Size(640, 400), CV_8UC3, Scalar(0));
        //namedWindow("Output", CV_WINDOW_AUTOSIZE);

        try {
            frame = imread(LOCATION, CV_LOAD_IMAGE_COLOR);
            //imshow("Output", frame);
            //throw ERROR_IMG_LOAD;
        }
        catch (int e) {
            cerr << "Error! Code ID: " << e << " Cannot Open Picture" << endl;
            cout << "Choose New File or Quit? Y/n: ";
            string YorN;
            cin >> YorN;
            cout << endl;
            if (YorN == "Y" || YorN == "y") {

            cout << "New Location: ";
            cin >> LOCATION;
            //frame = imread(LOCATION/*, CV_LOAD_IMAGE_COLOR*/);
            }
            else {
                cout << "Exiting" << endl;
                exit(30);
            }

        }
        //Eliminate file extensions
        LOCATION.pop_back();
        LOCATION.pop_back();
        LOCATION.pop_back();
        LOCATION.pop_back();

        LOCATION += "_Proc";
        LOCATION += ".png";


        //cout << "TEST" << endl;
        while (die == false) {
            //cout << "TEST" << endl;

            Mat HSVMat(Size(640, 400), CV_8UC3, Scalar (0));
            Mat PostFrame(Size(640, 400), CV_8UC3, Scalar (0));
            frame.copyTo(PostFrame);
            frame.copyTo(HSVMat);

            //cvtColor(frame, HSVMat, CV_RGB2HSV);
	
            Mat HSVMin(Size(640, 400), CV_8UC3, Scalar (0, 230, 0));
            Mat HSVMax(Size(640, 400), CV_8UC3, Scalar (255, 255, 255));
            Mat ThreshMat(Size(640, 400), CV_8U, Scalar(0));
            Mat PostFrame2(Size(640, 400), CV_8UC3, Scalar (0));
            Threshold(ThreshMat, HSVMin, HSVMax, HSVMat);
            contours = edgeDetect(ThreshMat, Scalar(0, 255, 0), PostFrame);
            boundRect = ShowTargets(contours, PostFrame);
		#ifdef DEBUG
		for (unsigned int i = 0; i < boundRect.size(); i++) {
			cout << "(Top Left) " <<  i << ") "<<boundRect[i].tl().x << "," << boundRect[i].tl().y << endl;
			cout <<  "(Bottom Right) "<< i << ") "<<boundRect[i].br().x << "," << boundRect[i].br().y << endl;	
		}
		#endif
    	    PostFrame2 = getLeftRight(PostFrame, 0.5, 20, Scalar(0,255,0), 1, boundRect);
	    if (!finishedLoop){
            imwrite(LOCATION, PostFrame);
            finishedLoop = true;
		}
		cout << boundRect.size() << " RECTANGLES DETECTED" << endl;
            imshow ("Post", PostFrame);
            char k = cvWaitKey(5);
            if (k == 8) {
                std::ostringstream file;
                file << filename << i_snap << suffix;
                cv::imwrite(file.str(), frame);
                i_snap++;
            }


        }
	return 0;
              
     }



