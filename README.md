
#HOW TO EXECUTE PROGRAMS

##To execute a lex program
	gedit filename.l
	//Type program and save
	lex filename.l
	cc lex.yy.c -ll
	./a.out
	
##To execute a yacc program
	gedit filename.l
	//Type program and save
	gedit filename.y
	//Type program and save
	lex filename.l
	yacc -d filename.y
	cc lex.yy.c y.tab.c -ll
	./a.out
	
##To execute a shell program
	gedit filename.sh
	//Type program and save
	sh filename.sh
	(If arguments are to be passed)
	sh filename.sh arg1 arg2.... argn
	./a.out
	
##To execute a C program
	gedit filename.c
	//Type program and save
	cc filename.c
	./a.out
