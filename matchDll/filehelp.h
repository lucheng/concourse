#pragma once
#include "string"
#include "io.h"
using namespace std;

class filehelp
{
public:
	filehelp(void);
	~filehelp(void);
	static void getFileListInOneDir(string FileDir,string PostfixType, int &FileNum, std::vector<char*>& files);
	static char* getFileName(char* filePath);
};
