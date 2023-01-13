


FUNCTION IdFromLastNo(tblName, fieldName)
*How to use
*
*SET PROCEDURE to getid
*id = IdFromLastNo()
 	SELECT TOP 1 &fieldName FROM &tblName ORDER BY &fieldName DESC INTO ARRAY lastId

	IF _TALLY = 0 THEN
		RETURN 1
	ENDIF

 	RETURN lastId(1) + 1
ENDFUNC

FUNCTION IdFromLastNoSpecial(tblName, fieldName, filterType, filterNo)
*How to use
*
*SET PROCEDURE to getid
*id = IdFromLastNo()
	IF EMPTY(filterType) OR EMPTY(filterNo) THEN
		MESSAGEBOX("Syntax error: IdFromLastNoSpecial(tblName, fieldName, filterType, filterNo)")
		RETURN -1
	ENDIF
	
	DO CASE
		CASE filterType="<"
			SELECT TOP 1 &fieldName from &tblName WHERE &fieldName < filterNo ORDER BY &fieldName DESC INTO ARRAY lastId
		CASE filterType=">"
			SELECT TOP 1 &fieldName from &tblName WHERE &fieldName > filterNo ORDER BY &fieldName DESC INTO ARRAY lastId
		CASE filterType="<="
			SELECT TOP 1 &fieldName from &tblName WHERE &fieldName <= filterNo ORDER BY &fieldName DESC INTO ARRAY lastId
		CASE filterType=">="
			SELECT TOP 1 &fieldName from &tblName WHERE &fieldName >= filterNo ORDER BY &fieldName DESC INTO ARRAY lastId
		OTHERWISE
			MESSAGEBOX("Filter type must be '<', '>', '<=', or '>'")
			RETURN -1
	ENDCASE
	
	IF _TALLY = 0 THEN
		RETURN 1
	ENDIF

 	RETURN lastId(1) + 1
ENDFUNC


FUNCTION IdFromUnixTime
*How to use
*
*SET PROCEDURE to getid
*id = IdFromUnixTime()
 	ref = DATETIME(1970, 01, 01, 00, 00, 00)

 	RETURN DATETIME() - ref
ENDFUNC

