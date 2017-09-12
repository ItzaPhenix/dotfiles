#CC=gcc
CXX=g++
# CPPFLAGS=
#CFLAGS=-Wall -Werror -Wextra -pedantic -std=c99
CXXFLAGS=-Wall -Wextra -Werror -std=c++11 -pedantic -O3
#LDFLAGS=-L. -lmatrix
#LIB=libmatrix.so

DIR=src
OUT=bistromathique
S=main.cc \
  lexer.cc \
  integer.cc \
  parser.cc \
  lex_error.cc \
  already_exists.cc \
  shunting_yard.cc \
  parse_error.cc \
  calc_core.cc
SRC=$(addprefix $(DIR)/,$(S))

DIRT=tests
TEST=a.out
ST=
SRCT=$(addprefix $(DIRT)/,$(ST))

#OBJS=$(SRC:.c=.o)
#OBJFPIC=$(SRC:.c=.o.fpic)
OBJSXX=$(SRC:.cc=.o)
#OBJFPICXX=$(SRC:.cc=.o.fpic)
LOGIN=dupuis_a
PROJECT=bistromathique
TARBALL=$(LOGIN)-$(PROJECT).tar.bz2

-include makefile.rules

all: $(OUT)

#$(LIB): $(OBJS)
#	ar csr $@ $^

# $(LIB): $(OBJFPIC)
# 	$(CC) --shared -o $@ $^

#$(LIB): $(OBJFPICXX)
#	$(CXX) --shared -o $@ $^

#%.o: %.c
#	$(CC) $(CFLAGS) -c $^

#%.o.fpic: %.c
#	$(CC) $(CFLAGS) -fPIC -c -o $@ $^

#%.o: %.cc
#	$(CXX) $(CXXFLAGS) -c $^

#%.o.fpic: %.cc
#	$(CXX) $(CXXFLAGS) -fPIC -c -o $@ $^

$(OUT): $(OBJSXX)
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm -rf $(OUT) $(OBJSXX) $(DIRT)/$(TEST) $(OUT).core

distclean: clean
	rm -f makefile.rules
	$(RM) -r doc/latex doc/html

check:
# 	$(CXX) $(CXXFLAGS)  -o $(DIRT)/$(TEST) $(SRCT) $(LDFLAGS)
	time ./$(OUT) < $(DIRT)/input.in

export:
	git archive HEAD --prefix=$(LOGIN)-$(PROJECT) | bzip2 > $(TARBALL)

doc:
	$(MAKE) -C doc all

display: doc
	evince doc/latex/refman.pdf

.PHONY: clean
.PHONY: check
.PHONY: doc
