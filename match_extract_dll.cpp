// matchDll.cpp : 定义 DLL 应用程序的导出函数。
//
#include "stdafx.h"

#define TASK_PER_FILE 3
#define TEMP_EXTENSION "temp"
#define TEMPLATE_EXTENSION "myt"
#define TEMP_DIR "Templates\\"
#define NUM_ATTR "my_num"
#define SEMANTIC_ATTR "semantic"
#define RESULT_File "/Result/extraction.xml"
#define THRESHOLD(x) x*800/1000 

DWORD WINAPI Begin_matchAndAlign(LPVOID lpParam);
DWORD WINAPI Begin_extract(LPVOID lpParam);
int matchAndAlign(char* dir, char* tempDir, double rate) ;
void extract(char* templateFile,char* tempDir,char *dir);
int __stdcall STM(TiXmlElement *element1, TiXmlElement *element2,ElementList  *matchNodes1, ElementList  *matchNodes2);
void __stdcall align(TiXmlElement *element1, TiXmlElement *element2, ElementList  *matchNodes1, ElementList  *matchNodes2);
int __stdcall matchMarked(TiXmlElement* element1, TiXmlElement* element2, ElementList* result);

typedef struct _matchAndAlignArgument
{
	char *dir;
	char *tempDir;
	double rate;
}MATCHANDALIGNARGUMENT, *PMATCHANDALIGNARGUMENT;

typedef struct _extractArgument
{
	char *templateFile;
	char *tempDir;
	char *dir;
}EXTRACTARGUMENT, *PEXTRACTARGUMENT;

static int remanentFiles = 0;
static int totalFiles = 0;

static HANDLE hCurrentThread = NULL;
static DWORD dwThreadID = 0;

MATCH_EXTRACT_API void __stdcall Abort()
{
	if(hCurrentThread != NULL)
		TerminateThread(hCurrentThread, 0);
}

MATCH_EXTRACT_API void __stdcall BeginGeneratingTemplates(char* dir, char* tempDir, double rate)
{
	PMATCHANDALIGNARGUMENT pArgs = NULL;
	pArgs = (PMATCHANDALIGNARGUMENT)HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, sizeof(MATCHANDALIGNARGUMENT));
	if (pArgs == NULL)
		ExitProcess(2);

	pArgs->dir = dir;
	pArgs->rate = rate;
	pArgs->tempDir = tempDir;
	

	hCurrentThread = CreateThread(NULL, 0, Begin_matchAndAlign, pArgs, 0, &dwThreadID);

	if (hCurrentThread == NULL) 
	{
		ExitProcess(3);
	}

	WaitForSingleObject(hCurrentThread, INFINITE);
}

MATCH_EXTRACT_API void __stdcall BeginExtraction(char* templateFile, char* tempDir, char *dir)
{
	PEXTRACTARGUMENT pArgs = NULL;
	pArgs = (PEXTRACTARGUMENT)HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, sizeof(EXTRACTARGUMENT));
	if(pArgs == NULL)
		ExitProcess(2);

	pArgs->dir = dir;
	pArgs->templateFile = templateFile;
	pArgs->tempDir = tempDir;

	hCurrentThread = CreateThread(NULL, 0, Begin_extract, pArgs, 0, &dwThreadID);

	if (hCurrentThread == NULL)
	{
		ExitProcess(3);
	}

	WaitForSingleObject(hCurrentThread, INFINITE);
}

DWORD WINAPI Begin_matchAndAlign(LPVOID lpParam)
{
	PMATCHANDALIGNARGUMENT pArgs = (PMATCHANDALIGNARGUMENT)lpParam;
	try
	{
		matchAndAlign(pArgs->dir, pArgs->tempDir, pArgs->rate);
	}
	catch (exception const& ex)
	{
		std::ofstream out("d:/test/Begin_matchAndAlign_exception.txt");
		out << ex.what() << "\n";
		out.close();
	}
	
	return 0;
}

DWORD WINAPI Begin_extract(LPVOID lpParam)
{
	PEXTRACTARGUMENT pArgs = (PEXTRACTARGUMENT)lpParam;
	try{
		extract(pArgs->templateFile, pArgs->tempDir, pArgs->dir);
	}catch(exception const& ex){
		std::ofstream out("d:/test/Begin_extract_exception.txt");
		out << ex.what() << "\n";
		out.close();
	}
	
	return 0;
}

MATCH_EXTRACT_API int __stdcall RemanentFiles()
{
	return remanentFiles;
}

MATCH_EXTRACT_API int __stdcall TotalFileCount()
{
	return totalFiles;
}

int matchAndAlign(char* dir, char* tempDir, double rate) 
{			
	std::ofstream out("d:/test/match_extract_dll_matchAndAlign_exception.txt");
	

	totalFiles = 0;
	remanentFiles = 0;

	std::vector<char*> files;
	int size=0;

	filehelp::getFileListInOneDir(tempDir,TEMP_EXTENSION, size, files);

	string templateFile(dir);
	templateFile+=TEMP_DIR;
	int templateNum=0;
	
	ElementList  *roots1=xmlhelp::getRootList(files,size);

	ElementList  *roots2=new ElementList ();				
	int *nums=new int[size];

	

	int t=0;

	totalFiles = size;
	remanentFiles = size;

	while (size > 0){

		out << "size:" << size << endl;
		out.flush();
		--size;
		--remanentFiles;

		++templateNum;
		int total = 1;
		TiXmlElement *root = roots1->front();
		roots1->pop_front();
		bool flag1 = false;
		bool flag2 = false;		
		out << "test 1" << endl;
		out.flush();

		while (roots1->size() > 0) {

			TiXmlElement* root2 = roots1->front();
			out << "test 11" << endl;
			out.flush();
			roots1->pop_front();
			out << "test 12" << endl;
			out.flush();
			ElementList * nodes1 = new ElementList ();
			ElementList * nodes2 = new ElementList ();

			out << "test 13" << endl;
			out.flush();
			int w = STM(root, root2, nodes1, nodes2);
			out << "test 14" << endl;
			out.flush();
			int m = xmlhelp::getElementCount(root2);
			out << "test 15" << endl;
			out.flush();

			if ((double) w / m >= rate) {
				flag1 = true;
				++total;
				--size;
				--remanentFiles;
				out << "test 16" << endl;
				out.flush();
				align(root, root2, nodes1, nodes2);
				out << "test 17" << endl;
				out.flush();
				int n = xmlhelp::getNodeCount(root);
				out << "test 18" << endl;
				out.flush();
			} else {
				roots2->push_back(root2);
				flag2 = true;
			}
			if (roots1->size() == 0 && flag1 && flag2) {
				out << "test 19" << endl;
				out.flush();
				xmlhelp::move(roots1, roots2);
				out << "test 20" << endl;
				out.flush();
				flag1 = false;
				flag2 = false;
			}
			delete nodes1;
			delete nodes2;			
		}
		if (flag2){
			out << "test 21" << endl;
			out.flush();
			xmlhelp::move(roots1, roots2);
			out << "test 22" << endl;
			out.flush();
		}
		out << "test 2" << endl;
		out.flush();

		nums[templateNum - 1] = total;
		out << "test 23" << endl;
		out.flush();
		xmlhelp::reduceElement(root, THRESHOLD(total));
		out << "test 24" << endl;
		out.flush();
		string outFile=templateFile+utils::numToString(templateNum)+"-"+utils::numToString(total)+"."+TEMPLATE_EXTENSION;							
		root->GetDocument()->SaveFile(outFile.c_str());
		out << "test 25" << endl;
		out.flush();
	}
	out << "test 3" << endl;
	out.flush();

	for(int i = 0; i < files.size(); ++i){
		delete [] files[i];
	}
	out << "test 4" << endl;
	out.flush();

	delete [] nums;	
	delete roots1;
	delete roots2;
	out << "test 5" << endl;
	out.flush();

	return templateNum;
}

int __stdcall STM(TiXmlElement *element1, TiXmlElement *element2,ElementList  *matchNodes1, ElementList  *matchNodes2) 
{	
	std::ofstream out("d:/test/match_extract_dll_STM.txt");
	out << "test 1" << endl;
	out.flush();

	if (strcmp(element1->Value(),element2->Value())!=0 
		|| (NULL!=element1->Attribute("title") &&  NULL!=element2->Attribute("title") && strcmp(element1->Attribute("title"),element2->Attribute("title"))!=0)
		|| (NULL!=element1->Attribute("title") &&  NULL==element2->Attribute("title")) 
		|| (NULL==element1->Attribute("title") &&  NULL!=element2->Attribute("title"))){
			return 0;
	}
	out << "test 2" << endl;
	out.flush();
	int n=element1->ChildElementCount();
	int m=element2->ChildElementCount();

	TiXmlElement * child1=element1->FirstChildElement();
	TiXmlElement * child2=element2->FirstChildElement();	

	ElementList ** u=new ElementList  *[n+1];
	ElementList ** v=new ElementList  *[n+1];
	int ** c=new int * [n+1];
	int ** b=new int * [n+1];
	for (int i=0; i<n+1; ++i) {
		c[i] = new int[m+1];
		b[i] = new int[m+1];
		u[i] = new ElementList[m+1];
		v[i] = new ElementList[m+1];		
	}
	memset(c, 0, sizeof(c));
	memset(b, 0, sizeof(b));	

	int i=0;
	int j=0;
	TiXmlElement * p=child2;

	out << "test 3" << endl;
	out.flush();

	while (NULL!=child1) {
		++i;
		child2=p;
		j=0;
		while (NULL!=child2) {
			++j;
			int w=STM(child1,child2,&u[i][j],&v[i][j]);
			b[i][j]=0;
			c[i][j]=c[i-1][j-1]+w;
			if (c[i][j-1]>c[i][j]) {
				c[i][j]=c[i][j-1];
				b[i][j]=1;
			}
			if (c[i-1][j]>c[i][j]) {
				c[i][j]=c[i-1][j];
				b[i][j]=2;
			}
			child2=child2->NextSiblingElement();
		}
		child1=child1->NextSiblingElement();
	}	

	out << "test 4" << endl;
	out.flush();
	i=n;
	j=m;
	while (i>0 && j>0) {		
		if (b[i][j]==0) {			
			xmlhelp::add(matchNodes1,&u[i][j]);
			xmlhelp::add(matchNodes2,&v[i][j]);
			--i;
			--j;
		}else if(b[i][j]==1) {						
			--j;
		}else {
			--i;
		}	
	}

	out << "test 5" << endl;
	out.flush();
	matchNodes1->push_back(element1);
	matchNodes2->push_back(element2);
	out << "test 51" << endl;
	out << "n:" << n << endl;
	out << "m:" << m << endl;
	out << "c[n][m]:" << c[n][m] << endl;
	out.flush();
	int result=c[n][m]+1;
	out << "test 51a" << endl;
	out.flush();
	for (i=0; i<n+1; i++) {
		out << "test 51" << i << endl;
		out.flush();
		delete [] b[i];
		delete [] c[i];
		delete [] u[i];
		delete [] v[i];
		out << "test 51" << i << endl;
		out.flush();
	}
	out << "test 52" << endl;
	out.flush();
	delete [] b;	
	delete [] c;
	delete [] u;
	delete [] v;
	out << "test 6" << endl;
	out.flush();
	return result;	
}

void __stdcall align(TiXmlElement *element1, TiXmlElement *element2, ElementList  *matchNodes1, ElementList  *matchNodes2)
{			
	int n=element1->ChildElementCount();
	int m=element2->ChildElementCount();
	if (m == 0) {
		return;
	}	

	TiXmlElement * child1=element1->FirstChildElement();
	TiXmlElement * child2=element2->FirstChildElement();	
	ElementList  * nodes1=new ElementList();
	ElementList  * nodes2=new ElementList();
	while (child2!=NULL) {				
		if (find(matchNodes2->begin(),matchNodes2->end(),child2)!=matchNodes2->end()) {												
			while (child1!=NULL && find(matchNodes1->begin(),matchNodes1->end(),child1)==matchNodes1->end()) {												
				child1=child1->NextSiblingElement();				
			}		

			nodes1->push_back(child1);
			nodes2->push_back(child2);
			child1=child1->NextSiblingElement();
			child2=child2->NextSiblingElement();
		}	

		TiXmlElement * o=child2;						
		while (o!=NULL && find(matchNodes2->begin(),matchNodes2->end(),o)==matchNodes2->end()) {
			o=o->NextSiblingElement();		
		}
		if (o!=NULL && child1!=NULL && find(matchNodes1->begin(),matchNodes1->end(),child1)!=matchNodes1->end()) {			
			nodes1->push_back(child1);
			nodes2->push_back(o);			
			while (child2!=o) {					
				element1->InsertBeforeChild(child1,*child2);								
				child2=child2->NextSiblingElement();
			}														
			o=o->NextSiblingElement();
			child1=child1->NextSiblingElement();
		} else 
			if (o==NULL && child1==NULL) {								
				while(child2!=o) {
					element1->InsertEndChild(*child2);					
					child2=child2->NextSiblingElement();					
				}
			}		
			child2=o;			
	}	

	ElementList ::iterator i1=nodes1->begin();
	ElementList ::iterator j1=nodes2->begin();
	while( i1!=nodes1->end() && j1!=nodes2->end()) {
		TiXmlElement* node1=(TiXmlElement *) *i1;
		TiXmlElement* node2=(TiXmlElement *) *j1;	
		string numStr=node1->Attribute(NUM_ATTR);							
		int num=utils::stringToNum(numStr)+1;
		node1->SetAttribute(NUM_ATTR, num);		
		align(node1, node2, matchNodes1, matchNodes2);				
		++i1;
		++j1;
	}		
	delete nodes1;
	delete nodes2;
}

int __stdcall matchMarked(TiXmlElement* element1, TiXmlElement* element2, ElementList* result) {
	if (strcmp(element1->Value(),element2->Value())!=0 
		|| (NULL!=element1->Attribute("title") &&  NULL!=element2->Attribute("title") && strcmp(element1->Attribute("title"),element2->Attribute("title"))!=0)
		|| (NULL!=element1->Attribute("title") &&  NULL==element2->Attribute("title")) 
		|| (NULL==element1->Attribute("title") &&  NULL!=element2->Attribute("title"))){
			return 0;
	}	
	int n=element1->ChildElementCount();
	int m=element2->ChildElementCount();

	TiXmlElement * child1=element1->FirstChildElement();
	TiXmlElement * child2=element2->FirstChildElement();	

	ElementList  ** u=new ElementList  *[n+1];	
	int ** c=new int *[n+1];
	int ** b=new int *[n+1];
	for (int i=0; i<n+1; i++) {
		c[i] = new int[m+1];
		b[i] = new int[m+1];
		u[i] = new ElementList [m+1];		
	}

	memset(c, 0, sizeof(c));
	memset(b, 0, sizeof(b));

	int i=0;
	int j=0;
	TiXmlElement * p=child2;
	while (NULL!=child1) {	
		++i;
		child2=p;
		j=0;	
		while (NULL!=child2) {
			++j;
			int w=matchMarked(child1,child2,&u[i][j]);
			b[i][j]=0;
			c[i][j]=c[i-1][j-1]+w;
			if (c[i][j-1]>c[i][j]) {
				c[i][j]=c[i][j-1];
				b[i][j]=1;
			}
			if (c[i-1][j]>c[i][j]) {
				c[i][j]=c[i-1][j];
				b[i][j]=2;
			}
			child2=child2->NextSiblingElement();
		}
		child1=child1->NextSiblingElement();
	}	

	i=n;
	j=m;
	while (i>0 && j>0) {		
		if (b[i][j]==0) {			
			xmlhelp::add(result,&u[i][j]);			
			--i;
			--j;
		}else if(b[i][j]==1) {						
			--j;
		}else {
			--i;
		}	
	}

	int matchs=c[n][m]+1;

	for (i=0; i<n+1; i++) {
		delete [] b[i];
		delete [] c[i];
		delete [] u[i];
	}
	delete [] b;	
	delete [] c;
	delete [] u;

	if (element1->Attribute(SEMANTIC_ATTR) != NULL) {
		element2->SetAttribute(SEMANTIC_ATTR, element1->Attribute(SEMANTIC_ATTR));
		result->push_back((TiXmlElement*)element2->Clone());
	}	

	return matchs;
}

void extract(char* templateFile, char* tempDir, char* dir)
{
	std::ofstream out;
try{
	
	
	out.open("d:/test/extract_exception.txt");

	totalFiles = 0;
	remanentFiles = 0;

	TiXmlElement * root=xmlhelp::getRootElement(templateFile);	
	ElementList * semantics=new ElementList();
	int total=xmlhelp::getSemanticElements(root, semantics);	
	std::vector<char*> files;
	int size=0;
	filehelp::getFileListInOneDir(tempDir,TEMP_EXTENSION,size, files);

	out << "tempDir:" <<tempDir << "\n";
	out << "file size:" <<files.size() << "\n";

//	out.close();

	string extractFile(dir);
	extractFile+=RESULT_File;
	TiXmlDocument * outDoc=new TiXmlDocument();	
	TiXmlDeclaration * pDeclaration = new TiXmlDeclaration("1.0","GBK","");  
	outDoc->LinkEndChild(pDeclaration);
	TiXmlElement * rootElement=new TiXmlElement("extractions");
	outDoc->LinkEndChild(rootElement);
	TiXmlElement * titlesElement=new TiXmlElement("titles");
	rootElement->LinkEndChild(titlesElement);
	char ** titles=new char * [total+1];	
	titles[0]="网页名称";		
	for (int i=0; i<total; i++) {		
		TiXmlElement* element=semantics->front();				
		semantics->pop_front();
		titles[i+1]=new char[strlen(element->Attribute("semantic"))+1];
		strncpy(titles[i+1],element->Attribute("semantic"),sizeof(titles));
	}				
	for (int i=0; i<total+1; i++) {
		//cout<<titles[i]<<endl;
		TiXmlElement * titleElement=new TiXmlElement("title");
		titleElement->SetText(titles[i]);
		titlesElement->LinkEndChild(titleElement);		
	}	
	TiXmlElement * datasElement=new TiXmlElement("datas");
	rootElement->LinkEndChild(datasElement);		

	totalFiles = size;
	remanentFiles = size;
	
	for (int k=0; k<size; ++k,--remanentFiles) {		
		TiXmlElement * root2=xmlhelp::getRootElement(files[k]);
		ElementList * result=new ElementList();
		matchMarked(root, root2, result);


		int m=result->size();

		out << "size:" <<m << "\n";

		if (m>=THRESHOLD(total)) {
			
			TiXmlElement* dataElement=new TiXmlElement("data");
			datasElement->LinkEndChild(dataElement);
			char** datas=new char * [total+1];						
			for (int i=0; i<total+1; ++i) {
				datas[i]="";
			}
			datas[0]=filehelp::getFileName(files[k]);																			
			for (int j=0; j<m; ++j){
				TiXmlElement * element=result->front();				
				result->pop_front();								
				for (int i=1; i<total+1; ++i) {							
					if (strncmp(element->Attribute("semantic"),titles[i], strlen(titles[i]))==0) {																			
						string s=xmlhelp::getStringValue(element);						
						datas[i]=new char[strlen(s.c_str())+1];
						strncpy(datas[i], s.c_str(), sizeof(datas[i]));																			
						break;
					}
				}				
			}			
			for (int i=0; i<total+1; ++i) {
				TiXmlElement * valueElement=new TiXmlElement("value");									
				valueElement->SetText(datas[i]);				
				dataElement->LinkEndChild(valueElement);
			}			
		}		
	}
	out.close();

	outDoc->SaveFile(extractFile.c_str());
	
}
catch (...)
{
	out.close();
	return;
}
out.close();
}