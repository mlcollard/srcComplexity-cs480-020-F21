# Build for srcComplexity

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ -std=c++17 srcComplexity.o srcMLXPathCount.o -lxml2 -o srccomplexity

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ -std=c++17 -c srcComplexity.cpp

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ -std=c++17 -c srcMLXPathCount.cpp
