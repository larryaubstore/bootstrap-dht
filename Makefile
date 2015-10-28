CC = g++

PROG = dhtbootstrap 
OBJS = lazy_bdecode.o main.o
TRGTS = $(OBJS) dht 


TESTDIR = tests

CFLAGS  = -g -O2 -std=c++11 -pthread

INCLUDE =  -I /root/boost_1_55_0/boost -I . 
LIBS  =  -L/usr/lib/i386-linux-gnu -L/usr/local/lib -lboost_system -lboost_filesystem -L/usr/local/lib

$(PROG): $(TRGTS)

.cpp.o:
	$(CC) $(INCLUDE) $(CFLAGS) -c $*.cpp $(LIBS)


dht: lazy_bdecode.o main.o
	$(CC) $(INCLUDE) -o $@ $? $(CFLAGS) $(LIBS)


all: $(TRGTS)

clean:
	rm -f *.o *~
