oMine1 = NEWOBJECT("myclass", "myclass.prg", NULL, 27, "Mustang" )
? oMine1.Flivver  && Returns 37
? oMine1.Giblet   && Returns "Mustang"

oMine2 = NEWOBJECT("myclass" , "myclass.prg"  )
? oMine2.Flivver  && Returns 0
? oMine2.Giblet   && Returns ""

oMine3 = NEWOBJECT("anotherclass",  "myclass.prg", NULL, 14, "ford")
? oMine3.price  && Returns 14
? oMine3.model   && Returns ""


