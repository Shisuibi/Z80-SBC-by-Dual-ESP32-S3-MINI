100 REM **** ---- DOWN MAZE ----
110 REM **** by Kutarahashii for PASOPIA, TOSHIBA Corporation
120 REM **** Micom BASIC Magazine - Issue 12 - June 1983
130 ES$=CHR$(27)+"[":CL$=ES$+"2J":DIM M$(9),R(9):HS=0
200 M$(0)="                          "
210 M$(1)="#  ###              ### ##"
220 M$(2)="##        ###    ##     ##"
230 M$(3)="#  ### ###     #######  ##"
240 M$(4)="##       # #      ###    #"
250 M$(5)="#          ####          #"
260 M$(6)="## #  #             ##  ##"
270 M$(7)="#  #  #    ###   ## ##   #"
280 M$(8)="# ##  #      #  ##   ### #"
290 M$(9)="# ####    ###        #  ##"
300 PRINT CL$:X=13:SC=0:FOR I=0 TO 9:R(I)=0:NEXT I
400 PRINT ES$;"15;1H";LEFT$(M$(R(0)),X);"O";
410 PRINT RIGHT$(M$(R(0)),25-X):A=INT(RND(1)*9)+1
420 IF MID$(M$(R(1)),X+1,1)="#" THEN 600
500 FOR I=0 TO 8:R(I)=R(I+1):NEXT I:R(9)=A
510 PRINT ES$;"25;1H";M$(A)
520 SC=SC+1:IF SC>HS THEN HS=SC
530 PRINT ES$;"1;27H";SC;"m";" /";HS;"m"
540 K$="":GOTO 400
600 PRINT ES$;"3;28H";"Give..G"
610 PRINT ES$;"2;28H";"Z <-> X";:IF K$="" THEN INPUT K$:D$=""
620 IF K$<>"" THEN D$=LEFT$(K$,1):K$=RIGHT$(K$,LEN(K$)-1)
630 IF D$="z" AND MID$(M$(R(0)),X  ,1)<>"#" THEN X=X-1:GOTO 400
640 IF D$="x" AND MID$(M$(R(0)),X+2,1)<>"#" THEN X=X+1:GOTO 400
650 IF D$<>"g" THEN 610
700 PRINT ES$;"12;28H";"***** GAME OVER *****";SC;"m"
710 PRINT ES$;"15;31H";"REPLAY?  (Y/N)";:INPUT K$
720 IF K$="y" THEN 300
730 IF K$<>"n" THEN 710
740 PRINT CL$
