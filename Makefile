PROGRAM = test
VERSION = 1.0

MODOBJECTS = mod_singInt.o
OBJECTSF90 = test.o 

INST = $(HOME)/bin
HOST = $(shell hostname)

# compiler
FC = gfortran

# Debug version    
#OPT = -g -fbounds-check -Wall -fcheck=all
#OPDE= d
# Optimized version
OPT = -O3
OPDE= o  

# options
FCOPTS = -ffixed-line-length-132  -fcray-pointer -cpp 
LDOPTO =



all: mod f90
	$(FC) -o $(PROGRAM) $(FCOPTS) $(MODOBJECTS) $(OBJECTSF90) $(OBJECTSFIX) $(LDOPTO)

mod: $(MODOBJECTS)
f90: $(OBJECTSF90)

clean:
	 rm -f *.o *.mod .#*


$(OBJECTSF90): %.o: %.f90
	 $(FC) $(FCOPTS) $(OPT) -c  $<

$(MODOBJECTS): %.o: %.f90
	 $(FC) $(FCOPTS) $(OPT) -c  $<


install:
	cp $(LINS)/$(PROGRAM) $(INST)/$(PROGRAM)-$(VERSION)-$(OPDE)
	 
#
# Instalacija BLAS in LAPAC knjiznic
# sudo apt-get update
# sudo apt-get install libblas-dev liblapack-dev
#	 
