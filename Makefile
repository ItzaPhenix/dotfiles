#CC=gcc
CXX?=g++
# CPPFLAGS=
#CFLAGS=-Wall -Werror -Wextra -pedantic -std=c99
CXXFLAGS=-Wall -Wextra -Werror -pedantic -std=c++11
LDFLAGS=-L. -lreplace
LIB=libreplace.so

DIR=src
OUT=
S=replace.cc
SRC=$(addprefix $(DIR)/,$(S))

DIRT=tests
TEST=test
ST=test.cc
SRCT=$(addprefix $(DIRT)/,$(ST))

#OBJS=$(SRC:.c=.o)
#OBJFPIC=$(SRC:.c=.o.fpic)
#OBJSXX=$(SRC:.cc=.o)
OBJFPICXX=$(SRC:.cc=.o.fpic)
LOGIN=dupuis_a
PROJECT=replace
TARBALL=$(LOGIN)-$(PROJECT).tar.bz2

-include makefile.rules

all: $(LIB)

#$(LIB): $(OBJS)
#	ar csr $@ $^

# $(LIB): $(OBJFPIC)
# 	$(CC) --shared -o $@ $^

$(LIB): $(OBJFPICXX)
	$(CXX) --shared -o $@ $^

#%.o: %.c
#	$(CC) $(CFLAGS) -c $^

#%.o.fpic: %.c
#	$(CC) $(CFLAGS) -fPIC -c -o $@ $^

#%.o: %.cc
#	$(CXX) $(CXXFLAGS) -c $^

%.o.fpic: %.cc
	$(CXX) $(CXXFLAGS) -fPIC -c -o $@ $^

#$(OUT): $(SRC)
#	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm -rf $(LIB) $(OBJFPICXX) $(DIRT)/$(TEST)

#distclean:
#	rm -f makefile.rules

check:
	$(CXX) $(CXXFLAGS)  -o $(DIRT)/$(TEST) $(SRCT) $(LDFLAGS)
	./$(DIRT)/$(TEST)

export:
	git archive HEAD --prefix=$(LOGIN)-$(PROJECT) | bzip2 > $(TARBALL)

#doc:
#	$(MAKE) -C doc all

.PHONY: clean
.PHONY: check
#.PHONY: doc
