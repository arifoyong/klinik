SET DEFAULT TO C:\Play-Foxpro\klinik
SET PATH TO data;forms;prgs;reports;menus
CLOSE TABLES
CLEAR ALL

PUBLIC gcVersion as string 
PUBLIC gcDbDir, gcNotaDir as string

gcVersion = "2.1.3"
gcDbDir = "C:\Play-Foxpro\klinik\data"
*gcNotaDir = "C:\Play-Foxpro\nota"


* =================================================== *
PUBLIC gcUsername, gcFullname,gcLevel  as string

gcUsername = ""
gcFullname = ""
gcLevel  = ""

DO FORM main_form
* =================================================== *