#define MATCH_EXTRACT_DLL
#ifdef MATCH_EXTRACT_DLL
#define MATCH_EXTRACT_API __declspec(dllexport)
#else
#define MATCH_EXTRACT_API __declspec(dllimport)
#endif
/* Set up for C function definitions, even when using C++ */
#include "stdafx.h"
#include "iostream"
#include "xmlhelp.h"
#include "filehelp.h"
#include "utils.h"
using namespace std;

#ifdef __cplusplus
extern "C" {
#endif
	MATCH_EXTRACT_API void __stdcall Abort();
	MATCH_EXTRACT_API int __stdcall RemanentFiles();
	MATCH_EXTRACT_API int __stdcall TotalFileCount();
    MATCH_EXTRACT_API void __stdcall BeginExtraction(char* templateFile, char* tempDir, char *dir);
	MATCH_EXTRACT_API void __stdcall BeginGeneratingTemplates(char* dir, char* tempDir, double rate);
	
	/* Ends C function definitions when using C++ */
#ifdef __cplusplus
}
#endif