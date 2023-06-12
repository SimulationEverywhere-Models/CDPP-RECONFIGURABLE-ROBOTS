% SELF-RECONFIGURABLE ROBOT MODEL
% by Ricardo Kirkner rkirkner@dc.uba.ar
% 11/03/2004

[top]
components : reconfig

[reconfig]
type : cell
dim : (15,45)
delay : transport
defaultDelayTime : 100
border : wrapped

%2D
neighbors :                 reconfig(-1,-1) reconfig(-1,0) reconfig(-1,1)
neighbors :                 reconfig(0,-1)  reconfig(0,0)  reconfig(0,1)
neighbors : reconfig(1,-2)  reconfig(1,-1)  reconfig(1,0)  reconfig(1,1)

initialValue : 0
initialCellsValue : reconfig.val
localtransition : reconfig

%%% LEGEND
%%%  0: empty cell
%%%  1: robot not moving
%%%  2: obstacle
%%%  3: moving up
%%%  4: moving up and to the right
%%%  5: moving to the right
%%%  6: moving down and to the right
%%%  7: moving down
%%%  8: moving up and to the left
%%%  9: moving down and to the left
%%% 10: moving to the left
%%%  _: any cell value
%%%  y: any non-obstacle cell
%%%  z: any robot cell (moving or not)
%%%  a: robot not moving or obstacle
%%%  b: any cell moving
%%%  c: empty cell or obstacle

[reconfig]
% 001       001
% 011   =>  031
% ___       ___
rule : 3 0 {(-1,-1)=0 and (-1,0)=0 and (-1,1)=1 and (0,-1)=0 and (0,0)=1 and (0,1)=1}
% ___       ___
% 001   =>  011
% 031       031
rule : 1 100 {(0,-1)=0 and (0,0)=0 and (0,1)=1 and (1,-1)=0 and (1,0)=3 and (1,1)=1}
% 001	=>	001
% 031		001 
% ___		___
rule : 0 100 {(-1,-1)=0 and (-1,0)=0 and (-1,1)=1 and (0,-1)=0 and (0,0)=3 and (0,1)=1}
% 00b		00b
% 031	=>	011
% ___		___
rule : 1 100 {(-1,-1)=0 and (-1,0)=0 and (-1,1)>2 and (0,-1)=0 and (0,0)=3 and (0,1)=1}
% c00     	c00
% c11   =>  c41
% __y       __y
rule : 4 0 {((-1,-1)=0 or (-1,-1)=2) and (-1,0)=0 and (-1,1)=0 and ((0,-1)=0 or (0,-1)=2) and (0,0)=1 and (0,1)=1 and (1,1)!=2}
% c00		c00
% c11	=>	c41
% ccc		ccc
rule : 4 0 {((-1,-1)=0 or (-1,-1)=2) and (-1,0)=0 and (-1,1)=0 and ((0,-1)=0 or (0,-1)=2) and (0,0)=1 and (0,1)=1 and ((1,-1)=0 or (1,-1)=2) and ((1,0)=0 or (1,0)=2) and ((1,1)=0 or (1,1)=2)}
% ___       ___
% 00_   =>  01_
% 41_       41_
rule : 1 100 {(0,-1)=0 and (0,0)=0 and (1,-1)=4 and (1,0)=1}
% c00       c00
% c41   =>  c01
% ___       ___
rule : 0 100 {((-1,-1)=0 or (-1,-1)=2) and (-1,0)=0 and (-1,1)=0 and ((0,-1)=0 or (0,-1)=2) and (0,0)=4 and (0,1)=1}
% c00		c00
% c4_	=>	c1_
% ___		___
rule : 1 100 {((-1,-1)=0 or (-1,-1)=2) and (-1,0)=0 and (-1,1)=0 and ((0,-1)=0 or (0,-1)=2) and (0,0)=4}
% c00       c00
% _10   =>  _50
% z11       z11
rule : 5 0 {((-1,-1)=0 or (-1,-1)=2) and (-1,0)=0 and (-1,1)=0 and (0,0)=1 and (0,1)=0 and ((1,-1)!=2 and (1,-1)!=0) and (1,0)=1 and (1,1)=1}
% c00		c00
% c10	=>	c50
% _11		_11
rule : 5 0 {((-1,-1)=0 or (-1,-1)=2) and (-1,0)=0 and (-1,1)=0 and ((0,-1)=0 or (0,-1)=2) and (0,0)=1 and (0,1)=0 and (1,0)=1 and (1,1)=1}
% ___       ___
% 50_   =>  51_
% 11_       11_
rule : 1 100 {(0,-1)=5 and (0,0)=0 and (1,-1)=1 and (1,0)=1}
% c00       c00
% _50   =>  _00
% _11       _11
rule : 0 100 {((-1,-1)=0 or (-1,-1)=2) and (-1,0)=0 and (-1,1)=0 and (0,0)=5 and (0,1)=0 and (1,0)=1 and (1,1)=1}
% 000		000
% _50	=>	_10
% _1_		_1_
rule : 1 100 {(-1,-1)=0 and (-1,0)=0 and (-1,1)=0 and (0,0)=5 and (0,1)=0 and (1,0)=1}
% 000		000
% _10	=>	_60
% y10		y10
rule : 6 0 {(-1,-1)=0 and (-1,0)=0 and (-1,1)=0 and (0,0)=1 and (0,1)=0 and (1,-1)!=2 and (1,0)=1 and (1,1)=0}
% 000		000
% c10	=>	c60
% _10		_10
rule : 6 0 {(-1,-1)=0 and (-1,0)=0 and (-1,1)=0 and ((0,-1)=0 or (0,-1)=2) and (0,0)=1 and (0,1)=0 and (1,0)=1 and (1,1)=0}
% 60_       60_
% 10_   =>  11_
% ___       ___
rule : 1 100 {(-1,-1)=6 and (-1,0)=0 and (0,-1)=1 and (0,0)=0}
% 000       000
% _60   =>  _00
% _10       _10
rule : 0 100 {(-1,-1)=0 and (-1,0)=0 and (-1,1)=0 and (0,0)=6 and (0,1)=0 and (1,0)=1 and (1,1)=0}
% ___		___
% 11c	=>	17c
% 10c		10c
rule : 7 0 {(0,-1)=1 and (0,0)=1 and ((0,1)=0 or (0,1)=2) and (1,-1)=1 and (1,0)=0 and ((1,1)=0 or (1,1)=2)}
% _7_       _7_
% 10_   =>  11_
% ___       ___
rule : 1 100 {(-1,0)=7 and (0,-1)=1 and (0,0)=0}
% ___		___
% _7c	=>	_0c
% 10c		10c
rule : 0 100 {(0,0)=7 and ((0,1)=0 or (0,1)=2) and (1,-1)=1 and (1,0)=0 and ((1,1)=0 or (1,1)=2)}
% 01a		01a
% 01c	=>	08c
% ccc		ccc
rule : 8 0 {(-1,-1)=0 and (-1,0)=1 and ((-1,1)=1 or (-1,1)=2) and (0,-1)=0 and (0,0)=1 and ((0,1)=0 or (0,1)=2) and ((1,-1)=0 or (1,-1)=2) and ((1,0)=0 or (1,0)=2) and ((1,1)=0 or (1,1)=2)}
% ___		___
% 001	=>	011
% 008		008
rule : 1 100 {(0,-1)=0 and (0,0)=0 and (0,1)=1 and (1,-1)=0 and (1,0)=0 and (1,1)=8}
% 01a		01a
% 08c	=>	00c
% ccc		ccc
rule : 0 100 {(-1,-1)=0 and (-1,0)=1 and ((-1,1)=1 or (-1,1)=2) and (0,-1)=0 and (0,0)=8 and ((0,1)=0 or (0,1)=2) and ((1,-1)=0 or (1,-1)=2) and ((1,0)=0 or (1,0)=2) and ((1,1)=0 or (1,1)=2)}
% ____		____
% _110	=>	_190
% a000		a000
rule : 9 0 {(0,-1)=1 and (0,0)=1 and (0,1)=0 and ((1,-2)=1 or (1,-2)=2) and (1,-1)=0 and (1,0)=0 and (1,1)=0}
% _19		_19
% a00	=>	a10
% ___		___
rule : 1 100 {(-1,0)=1 and (-1,1)=9 and ((0,-1)=1 or (0,-1)=2) and (0,0)=0 and (0,1)=0}
% ____		____
% _190	=>	_100
% a000		a000
rule : 0 100 {(0,-1)=1 and (0,0)=9 and (0,1)=0 and ((1,-2)=1 or (1,-2)=2) and (1,-1)=0 and (1,0)=0 and (1,1)=0}
% default rule ...
rule : {(0,0)} 10 {t}

