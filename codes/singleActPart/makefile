compile = mpif90 
#
obj_main=main.o  force.o  posup.o shuffle.o  \
vnlist.o vnlistcheck.o sort.o int_write.o    \
int_param.o sysupdate.o  wfile.o     \
wconfig.o  flushkob.o  energy.o  listcell.o  \
addnumtostring.o  initialisation.o wenergy.o \
thetaup.o
#
obj_parameter=mod_param.o
#
result.exe:$(obj_main) $(obj_parameter)
	$(compile) $(obj_main) $(obj_parameter) -o result.exe -lm
####
main.o:main.f90 $(obj_parameter)
	$(compile) -c main.f90 $(obj_parameter)
force.o:force.f90 $(obj_parameter)
	$(compile) -c force.f90 $(obj_parameter)
posup.o:posup.f90 $(obj_parameter)
	$(compile) -c posup.f90 $(obj_parameter)
thetaup.o:thetaup.f90 $(obj_parameter)
	$(compile) -c thetaup.f90 $(obj_parameter)
vnlist.o:vnlist.f90 $(obj_parameter)
	$(compile) -c vnlist.f90 $(obj_parameter)
vnlistcheck.o:vnlistcheck.f90 $(obj_parameter)
	$(compile) -c vnlistcheck.f90 $(obj_parameter)
int_param.o:int_param.f90 $(obj_parameter)
	$(compile) -c int_param.f90 $(obj_parameter)
sysupdate.o:sysupdate.f90 $(obj_parameter)
	$(compile) -c sysupdate.f90 $(obj_parameter)
initialisation.o:initialisation.f90 $(obj_parameter)
	$(compile) -c initialisation.f90 $(obj_parameter)
energy.o:energy.f90 $(obj_parameter)
	$(compile) -c energy.f90 $(obj_parameter)
wenergy.o:wenergy.f90 $(obj_parameter)
	$(compile) -c wenergy.f90 $(obj_parameter)
wfile.o:wfile.f90 $(obj_parameter)
	$(compile) -c wfile.f90 $(obj_parameter)
sort.o:sort.f $(obj_parameter)
	$(compile) -c sort.f $(obj_parameter)
flushkob.o:flushkob.f $(obj_parameter)
	$(compile) -c flushkob.f $(obj_parameter)
int_write.o:int_write.f $(obj_parameter)
	$(compile) -c int_write.f $(obj_parameter)
wconfig.o:wconfig.f $(obj_parameter)
	$(compile) -c wconfig.f $(obj_parameter)
addnumtostring.o:addnumtostring.f $(obj_parameter)
	$(compile) -c addnumtostring.f $(obj_parameter)
shuffle.o:shuffle.f90 $(obj_parameter)
	$(compile) -c shuffle.f90 $(obj_parameter)
listcell.o:listcell.f90 $(obj_parameter)
	$(compile) -c listcell.f90 $(obj_parameter)
#
mod_param.o:mod_param.f90
	$(compile) -c mod_param.f90
#
clean:
	rm -f *.o *.mod *.MOD
