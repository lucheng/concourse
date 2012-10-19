#pragma once
#include "iostream"
#include "sstream"
#include "string"

using namespace std;

class utils
{
public:
	utils(void);
	~utils(void);

	
	static int stringToNum(const string& str);
	
	static string numToString(const int& str);

};
