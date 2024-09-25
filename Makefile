CXX ?= g++
LEX ?= flex++

CXXFLAGS := -Wall -ansi -pedantic -std=c++20

lexington: main.o lex.yy.o Token.o
	$(CXX) -o lexington main.o lex.yy.o Token.o

main.o: main.cpp
	$(CXX) $(CXXFLAGS) -c main.cpp

Token.o: Token.cpp
	$(CXX) $(CXXFLAGS) -c Token.cpp

lex.yy.o: lex.yy.cc
	$(CXX) $(CXXFLAGS) -c lex.yy.cc

lex.yy.cc: lex.l
	$(LEX) lex.l

clean:
	rm -rf lexington *.o

.PHONY: clean
