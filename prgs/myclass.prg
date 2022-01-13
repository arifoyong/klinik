DEFINE CLASS myclass AS CUSTOM
   * add some properties
   Flivver = 0
   Giblet = ""

PROCEDURE Init
   LPARAMETERS nFlivver, cGiblet

   IF NOT EMPTY(nFlivver)
      This.Flivver = nFlivver
   ENDIF
   IF NOT EMPTY(cGiblet)
      This.Giblet = cGiblet
   ENDIF
ENDPROC

ENDDEFINE



DEFINE CLASS nota AS CUSTOM
	nBaru = 0
	nBlumbo = 0 
	nBlumun = 0
	nCekana = 0
	nDisno = 0
	nDispe = 0.0
	nEdit = 0
	nHarga = 0
	nHawal = 0
	nHlama = 0
	nHsatu = 0
	cJenis = ""
	nJuml = 0
	cKode = ""
	nNont = 0
	nNovd = 0
	cObat = ""
	nPerbox = 0
	nPpn = 0.0
	dTgd = DATE(1970,1,1)
	cVendor = ""
	nVolb = 0
	nVolu = 0

PROCEDURE Init
   LPARAMETERS price , model 

   IF NOT EMPTY(price )
      This.price = price 
   ENDIF
   IF NOT EMPTY(model )
      This.model = model 
   ENDIF
ENDPROC

ENDDEFINE