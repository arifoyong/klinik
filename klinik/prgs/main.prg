CLEAR ALL
CLOSE TABLES

PUBLIC gcVersion as string
PUBLIC gcDefaultDir as string

gcVersion = "2.2.1"
gcDefaultDir = "Z\ming\klinik"

SET DEFAULT TO (gcDefaultDir )
SET PATH TO data;forms;prgs;reports;menus

* =================================================== *
PUBLIC gcUsername, gcFullname,gcLevel  as string

gcUsername = ""
gcFullname = ""
gcLevel  = ""

DO FORM main_form
* =================================================== *