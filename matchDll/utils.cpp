#include "StdAfx.h"
#include "utils.h"

utils::utils(void)
{
}

utils::~utils(void)
{
}


int utils::stringToNum(const string& str)
{
	istringstream iss(str);
	int num;
	iss>>num;
	return num;
}

string utils::numToString(const int& num) {
	stringstream strStream; 
	strStream<<num;
	string s = strStream.str(); 
	return s;
}