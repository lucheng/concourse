#include "StdAfx.h"
#include "xmlhelp.h"


#define STYLE_ATTR "style"
#define NUM_ATTR "my_num"

xmlhelp::xmlhelp(void)
{
}

xmlhelp::~xmlhelp(void)
{
}

void xmlhelp::init(TiXmlElement* element) 
{	
	element->RemoveAttribute(STYLE_ATTR);

	element->SetAttribute(NUM_ATTR,1);

	TiXmlElement * child=element->FirstChildElement();
	while (child!=NULL) {
		init(child);
		child=child->NextSiblingElement();
	}

}

int xmlhelp::getElementCount(TiXmlElement *element) 
{
	int t=1;			
	TiXmlElement * child=element->FirstChildElement();	
	while (NULL!=child) {					
		t+=getElementCount(child);		
		child=child->NextSiblingElement();
	}	
	return t;
}

int xmlhelp::getNodeCount(TiXmlNode *node) 
{
	int t=1;
	if (node->Type()==TiXmlNode::TINYXML_ELEMENT) {				
		TiXmlElement * element=(TiXmlElement *)node;		
		TiXmlNode * child=element->FirstChild();
		while (NULL!=child) {			
			t+=getNodeCount(child);
			child=child->NextSibling();
		}
	}
	return t;
}

int xmlhelp::STM(TiXmlElement *element1, TiXmlElement *element2) 
{	
	if (strcmp(element1->Value(),element2->Value())!=0 
		|| (NULL!=element1->Attribute("title") &&  NULL!=element2->Attribute("title") && strcmp(element1->Attribute("title"),element2->Attribute("title"))!=0)
		|| (NULL!=element1->Attribute("title") &&  NULL==element2->Attribute("title")) 
		|| (NULL==element1->Attribute("title") &&  NULL!=element2->Attribute("title"))){
			return 0;
	}	
	int n=element1->ChildElementCount();
	int m=element2->ChildElementCount();

	TiXmlElement *child1=element1->FirstChildElement();
	TiXmlElement *child2=element2->FirstChildElement();	

	int** c=new int *[n+1];	
	for (int i=0; i<n+1; i++) {
		c[i] = new int[m+1];
		for (int j=0; j<m+1; j++) {
			c[i][j]=0;
		}
	}

	int i=0;
	while (NULL!=child1) {	
		i++;
		TiXmlElement *p=child2;
		int j=0;
		while (NULL!=p) {
			j++;
			int w=STM(child1,p);
			c[i][j]=c[i-1][j-1]+w;
			if (c[i][j-1]>c[i][j]) {
				c[i][j]=c[i][j-1];
			}
			if (c[i-1][j]>c[i][j]) {
				c[i][j]=c[i-1][j];
			}

			p=p->NextSiblingElement();
		}
		child1=child1->NextSiblingElement();
	}	
	return c[n][m]+1;	
}

TiXmlElement * xmlhelp::getRootElement(char* file)
{
	TiXmlDocument * myDocument = new TiXmlDocument();  
	myDocument->LoadFile(file);      
	TiXmlElement * rootElement = myDocument->RootElement();          				
	return rootElement;
}

ElementList * xmlhelp::getRootList(std::vector<char*> &files, int size) 
{
//	std::ofstream out("d:/test/xmlhelp_getRootList_exception.txt");

	ElementList * rootList=new ElementList();
//	out << "test 1" << endl;
//	out.flush();
	for (int i=0; i<size; i++) {
//		out << "root is not null!" << endl;
		TiXmlElement * root=getRootElement(files[i]);
		
		rootList->push_back(root);
	}
	
	return rootList;
}

void xmlhelp::add(ElementList * list1, ElementList * list2) 
{
	for (ElementList::iterator i=list2->begin(); i!=list2->end(); ++i) {
		list1->push_back((TiXmlElement *) *i);
	}
}

void xmlhelp::move(ElementList *list1, ElementList *list2) 
{
	for (ElementList::iterator i=list2->begin(); i!=list2->end(); ++i) {
		list1->push_back((TiXmlElement *) *i);		
	}
	list2->clear();	
}

int xmlhelp::getSemanticElements(TiXmlElement * element, ElementList * semantics) {	
	if (element->Attribute("semantic")!=NULL) {
		semantics->push_back(element);
	}
	TiXmlElement *child=element->FirstChildElement();	
	while (NULL!=child) {					
		getSemanticElements(child,semantics);
		child=child->NextSiblingElement();
	}	
	return semantics->size();
}

string xmlhelp::getStringValue(TiXmlNode * node)
{
	if(node->Type()==TiXmlNode::TINYXML_TEXT) {
		return node->ToText()->Value();
	}else {
		TiXmlNode * child=node->FirstChild();
		string s;
		while (child!=NULL) {
			s+=getStringValue(child);
			child=child->NextSibling();
		}
		return s;
	}
}

void xmlhelp::reduceElement(TiXmlElement * element,int num)
{
	TiXmlElement* child=element->FirstChildElement();
	while(child!=NULL){
		int temp = utils::stringToNum(child->Attribute("NUM_ATTR"));
		if (temp >= num) {
			reduceElement(child, num);
		} else {
			child->SetAttribute("class", "optional");
		}
		child=child->NextSiblingElement();
	}
}