PROCEDURE errHandler
   PARAMETER merror, mess, mess1, mprog, mlineno
   
   MESSAGEBOX("Error number: " + LTRIM(STR(merror)) + ". Error message: " + mess)
   *? 'Line of code with error: ' + mess1
   *? 'Line number of error: ' + LTRIM(STR(mlineno))
   *? 'Program with error: ' + mprog
ENDPROC

* Example of usage
*ON ERROR DO errHandler WITH ERROR( ), MESSAGE( ), MESSAGE(1), PROGRAM( ), LINENO( )
*	ROLLBACK  
*ON ERROR  && Restores system error handler.