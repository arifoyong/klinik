SET DEFAULT TO C:\Play-Foxpro\klinik
SET PATH TO data;forms;prgs;reports;menus


* ================================================== *
CLOSE TABLES
CLEAR ALL
PUBLIC gcUsername, gcFullname,gcLevel  as string
PUBLIC versionNo as string 

gcUsername = ""
gcFullname = ""
gcLevel  = ""
gcVersion = "2.1.1"

DO FORM main_form
* ================================================== *