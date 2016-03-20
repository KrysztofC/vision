#ifndef _MATH_HPP_
#define _MATH_HPP_

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <limits>

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/gpu/gpu.hpp>


using namespace std;
template <class T >
T getMin (vector < T> input) {
	size_t i;
	T minimum = 0;
	T minimum_out = 0;
	if (input.size() == 0)
		return numeric_limits<T>::max();
	if (input.size() == 1)
		return input[0];
	else{
		minimum = numeric_limits< T>::max();
		for (i = 0; i < input.size(); i++) {
			if (minimum > abs(input[i])) {
				minimum = abs(input[i]);
				minimum_out = input[i];
			}
		}
	}
	return minimum_out;
}
template <class T >
T getMax (vector <T> input) {
	size_t i;
	T maximum = 0;
	T maximum_out = 0;
	if (input.size() == 0)
		return numeric_limits<T>::min();
	if (input.size() == 1)
		return input[0];
	else{
		maximum = 0;
		for (i = 0; i < input.size(); i++) {
			if (maximum < abs(input[i])) {
				maximum = abs(input[i]);
				maximum_out = input[i];
			}
		}
	}
	return maximum_out;
}
template <class T>
int approx(T input, T target, T range) {
	if (input <= (target + range) && input >= (target - range))
		return 0;
 	else {
		if (!(input <= (target + range)) && input >= (target - range))
			return -1; //-1
		if (input <= (input + range) && !(input >= (target - range)))
			return 1; //1
	}
	return 0;
}
#endif /*_MATH_HPP_*/
