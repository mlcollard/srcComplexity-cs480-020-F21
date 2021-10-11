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
	gcov srcComplexity.gcda srcMLXPathCount.gcda

.PHONY: coverage/report
coverage/report : srccomplexity
	gcov srcComplexity.gcda | head -3

.PHONY: coverage/clean
coverage/clean :
	@rm -f *.gcda *.gcov

.PHONY: test
test : srccomplexity coverage/clean
	./srccomplexity srcMLXPathCount.cpp.xml
	./srccomplexity srcMLXPathCount.cpp.xml srcMLXPathCount.cpp.xml || true

.PHONY: run
run : srccomplexity
	./srccomplexity srcMLXPathCount.cpp.xml

.PHONY: clean
clean :
	@rm -f srccomplexity srcComplexity.o srcMLXPathCount.o *.gcno
