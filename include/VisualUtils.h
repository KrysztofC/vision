#ifndef VISUALUTILS_H_
#define VISUALUTILS_H_

#include <opencv2/opencv.hpp>
#include <opencv2/opencv_modules.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/video/video.hpp>
#include <iostream>
#include <fstream>
#include <cmath>
#include <vector>
#include <pthread.h>

using namespace std;
using namespace cv;

template <class T>
int approx(T input, T target, T range) {
	if (input <= (target + range) && input >= (target - range))
		return 0;
 	else {
		if (!(input <= (target + range)) && input >= (target - range))
			return -1;
		if (input <= (input + range) && !(input >= (target - range)))
			return 1;
	}
}

void getLeftRight(Mat & Frame, double scale, Scalar color, int thickness, string text, vector< cv::Rect > boundRects);

	bool drawReticle (cv::Mat & InFrame, int Size, Point Loc, Scalar Color) {
	Point MinX (((Loc.x - 18 * (Size) - 12)), Loc.y);
	Point MaxX (((Loc.x + 18 * (Size) + 12)), Loc.y);
	Point MinY (Loc.x, ((Loc.y - (18 * Size)) - 12));
	Point MaxY (Loc.x, ((Loc.y + (18 * Size)) + 12));

	cv::circle(InFrame, Loc, (36 * (Size / 2)), Color, Size, 8, 0);
	cv::circle(InFrame, Loc, (36 * Size), Color, Size, 8, 0);

	cv::line(InFrame, MinX, MaxX, Color, Size, 8, 0);
	cv::line(InFrame, MinY, MaxY, Color, Size, 8, 0);
	return true;
}
/*
template <class T>
T operator^(T number, T power) {
	T val;
	T currPower = number;
	for (auto i = 0; i <= power; i++) {
		currPower *= number;
	}
	val = currPower;
	return val;

}
*/
vector<vector<Point> > edgeDetect(Mat input, Scalar color, Mat & output) {
	vector<vector<Point> > contours;
	vector<Vec4i> hierarchy;
	findContours( input, contours, hierarchy, CV_RETR_CCOMP, CV_CHAIN_APPROX_SIMPLE);
	int idx = 0;
	if (idx > hierarchy.size()) {

		for ( ; idx >= 0; idx = hierarchy[idx][0]) {

			drawContours( output, contours, idx, color, CV_FILLED, 8, hierarchy);
		}
	}
	return contours;
}

vector <Rect > ShowTargets(vector <vector < Point> > contours, Mat Frame) {
	vector<vector <Point > > contours_poly( contours.size());
	vector<Rect > boundRect( contours.size());
	vector <Point2f>center(contours.size());
	vector <float> radius(contours.size());
	for (int i = 0; i < contours.size(); i++) {
		approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true);
		boundRect[i] = boundingRect( Mat (contours_poly[i]));
	}
	for (int i = 0; i < contours.size(); i++) {
		Scalar color (255, 0, 0);
		rectangle (Frame, boundRect[i].tl(),boundRect[i].br(), color, 2, 8, 0);
		Point p1 = boundRect[i].tl();
		Point p2 = boundRect[i].br();
		Point center = Point(((p1.x + p2.x)/2), ((p1.y + p2.y)/2));
		drawReticle(Frame, 2, center, Scalar(0,0,255));
	}
	return boundRect;
}
void Threshold(Mat & ThreshMat, Mat HSVMin, Mat HSVMax, Mat Frame) {
	inRange(Frame, HSVMin, HSVMax, ThreshMat);
}

int getProxToPoint (cv::Point pt1, Mat Frame) {
	int midline = (Frame.size().width / 2);
	int dist;
	dist = (midline - pt1.x);
	return dist;

}



Mat getLeftRight(Mat Frame, double scale, Scalar color, int thickness, vector <Rect > boundRects) {
	bool isWithinMargin = false;
	cv::Point point;
	int dist;
	int const midline = (Frame.size().width /2);
	
	for (int i =0 ; i <= boundRects.size(); i++) {
		cv::Point p1 = boundRects[i].tl();
		cv::Point p2 = boundRects[i].br();

		cv::Point center = Point(((p1.x + p2.x)/2), ((p1.y + p2.y)/2));
		dist = getProxToPoint(center, Frame);
		
		if (approx(dist,midline , 50) == 0) { 
			point = Point((p2.x -20), (p2.y + 10));
			putText(Frame, "Centered", point, FONT_HERSHEY_SIMPLEX, scale, color, thickness, 8, false);
		} else if (approx(dist, midline, 50) == -1) {
			point = cv::Point((p2.x -20), (p2.y +10));
			isWithinMargin = false;
			putText(Frame, "Left", point, FONT_HERSHEY_SIMPLEX, scale, color, thickness, 8, false);
		} else if (approx(dist,midline , 50) == 1) {
			point = cv::Point((p2.x -20), (p2.y +10));
			isWithinMargin = false;
			putText(Frame, "Right", point, FONT_HERSHEY_SIMPLEX, scale, color, thickness, 8, false);;


    		}
		else {
		cout << "ERROR OUT OF BOUNDS" << endl;
}	
		return Frame;
	}
}


#endif /* VISUALUTILS_H_ */
