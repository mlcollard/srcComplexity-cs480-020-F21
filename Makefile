# Build for srcComplexity

.PHONY: all
all : srccomplexity

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ -std=c++17 --coverage $^ -lxml2 -o $@

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ -std=c++17 --coverage -c $<

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ -std=c++17 --coverage -I/usr/include/libxml2 -c $<

.PHONY: coverage
coverage : srccomplexity
	gcov srccomplexity.gcda srcMLXPathCount.gcda

.PHONY: run
run : srccomplexity
	./srccomplexity srcMLXPathCount.cpp.xml

.PHONY: clean
clean :
	@rm -f srccomplexity srcComplexity.o srcMLXPathCount.o
