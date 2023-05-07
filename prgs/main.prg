SET DEFAULT TO C:\Play-Foxpro\klinik
SET PATH TO data;forms;prgs;reports;menus
CLOSE TABLES
CLEAR ALL

PUBLIC gcVersion as string 
PUBLIC gcDbDir as string
*PUBLIC gcDefaultDir as string

gcVersion = "2.2"
gcDefaultDir = "C:\Play-Foxpro\klinik"
*gcDbDir = "C:\Play-Foxpro\klinik_v3b\data"

* =================================================== *
PUBLIC gcUsername, gcFullname,gcLevel  as string

gcUsername = ""
gcFullname = ""
gcLevel  = ""

DO FORM main_form
* =================================================== *