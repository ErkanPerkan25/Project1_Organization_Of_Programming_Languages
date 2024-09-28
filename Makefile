CXX ?= g++
LEX ?= flex++

CXXFLAGS := -Wall -ansi -pedantic -std=c++20

lex-analyzer: main.o lex.yy.o Token.o
	$(CXX) -o lex-analyzer main.o lex.yy.o Token.o

main.o: main.cpp
	$(CXX) $(CXXFLAGS) -c main.cpp

Token.o: Token.cpp
	$(CXX) $(CXXFLAGS) -c Token.cpp

lex.yy.o: lex.yy.cc
	$(CXX) $(CXXFLAGS) -c lex.yy.cc

lex.yy.cc: lex.l
	$(LEX) lex.l

clean:
	rm -rf lex-analyzer lex.yy.cc *.o

.PHONY: clean
