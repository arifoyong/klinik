FUNCTION CopyFile(srcFolder, tgtFolder, fileName)
*How to use
*
*SET PROCEDURE to getid
*CopyFile("C:\Src", "C:\Destination", "file.dbf")
	FSO = CreateObject('Scripting.FileSystemObject')
	*FSO.CopyFile('c:\COMPlusLog.txt','c:\x\')

	srcFilename = srcFolder + "\" + fileName
	tgtFilename = tgtFolder + "\" + fileName
	
	IF FILE(srcFilename) = .F. THEN
		MESSAGEBOX(srcFilename + " does not exist")
		RETURN
	ENDIF
	
	IF DIRECTORY(tgtFolder) = .F. THEN
		MESSAGEBOX(tgtFolder + " does not exist")
		RETURN
	ENDIF

	IF FILE(tgtFilename) = .T. THEN
		newFileName = ttoc(datetime(), 1) + "_" + fileName
		RENAME (tgtFilename)  TO (tgtFolder + "\" + newFileName)
	ENDIF
	
	messagebox("Copying from " + srcFilename + " to " + tgtFilename )
	*COPY FILE (srcFilename ) TO (tgtFilename ) 
	
	FSO.CopyFile(srcFilename ,tgtFilename )
 	RETURN
ENDFUNC