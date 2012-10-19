#include "StdAfx.h"
#include "filehelp.h"

filehelp::filehelp(void)
{
}

filehelp::~filehelp(void)
{
}

void filehelp::getFileListInOneDir(string FileDir, string PostfixType, int &size, std::vector<char*> &files)
{	
	string filePath;
	struct _finddata_t fileinfo;
	int hFile = 0;	

	string FileDirTemp = FileDir;
	FileDirTemp += "*.*";

	if( (hFile = _findfirst( FileDirTemp.c_str(), &fileinfo) ) == -1L ) return;
//	std::ofstream out("d:/test/filehelp_getFileListInOneDir.txt");
//	out << "size:" << size << endl;
	while( _findnext( hFile, &fileinfo ) == 0 ){

		//如果是目录,迭代之  
		//如果不是,加入列表
		if( fileinfo.attrib &_A_SUBDIR )	{

		}else {
			string FileName = fileinfo.name;
			
			int Pos = FileName.find(PostfixType.c_str());
			if( Pos != string::npos ) {			
				filePath=FileDir+FileName;
				const char* temp=filePath.c_str();
				char* file=new char[strlen(temp)+1];
				strcpy(file,temp);

				files.push_back(file);
					
	//			out << "temp:" << file << endl;
				size++;
			}
		}
	}
//	out.close();

	_findclose( hFile );
}

char* filehelp::getFileName(char * filePath)
{
	char * s=strrchr(filePath,'\\')+1;
	s[strlen(s)-5]='\0';
	return s;
}