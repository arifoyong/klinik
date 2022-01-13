SET DEFAULT TO C:\Play-Foxpro\klinik_v2
SET PATH TO data;forms;prgs;reports;menus

CLOSE TABLES
CLEAR ALL
PUBLIC gcUsername, gcFullname,gcLevel  as string 

gcUsername = ""
gcFullname = ""
gcLevel  = ""


DO FORM main_form