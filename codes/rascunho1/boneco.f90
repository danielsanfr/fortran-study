program boneco

 use msflib
 
 implicit none

 type (xycoord) pos

 type (qwinfo) winfo

 integer i,ix,iy

 winfo.TYPE = QWIN$MAX

 i = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo)

 i = clickmenuqq(QWIN$STATUS)

 i = clickmenuqq(QWIN$TILE)

 i = setbkcolor(15)

 call clearscreen($gclearscreen)

 i = setcolor(0)

 i = ellipse($gborder,370,245,385,260)
 ! cabeca
 i = ellipse($gfillinterior,376,247,379,250)
 ! olho direito
 i = ellipse($gfillinterior,380,253,383,256)
 ! olho esquerdo
 call moveto(373,257,pos)
 
 i = lineto(355,271)
 ! corpo

 call moveto(373,257,pos)
 ! braço direito
 i = lineto(360,255)

 call moveto(373,257,pos)
 ! braço esquerdo
 i = lineto(373,270)

 call moveto(355,271,pos)
 ! perna direita
 i = lineto(342,269)

 call moveto(355,271,pos)
 ! perna esquerda
 i = lineto(355,284)


 ! capa
 call moveto(373,257,pos)
 
 i = lineto(358,261)
                                                            
 call moveto(373,257,pos)
 
 i = lineto(365,271)
 
 call moveto(358,261,pos)
 
 i = lineto(365,271)
 ! capa

 call moveto(775,5,pos)

 i = lineto(5,500)


 pause

 stop

 end program