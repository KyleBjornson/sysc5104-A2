[top]
components : rust

[rust]
type : cell
width : 50
height : 50
delay : transport
defaultDelayTime : 100
border : wrapped 
neighbors : rust(-1,-1) rust(-1,0) rust(-1,1) 
neighbors : rust(0,-1)  rust(0,0)  rust(0,1)
neighbors : rust(1,-1)  rust(1,0)  rust(1,1)
initialvalue : 0
initialrowvalue :  5     00000000000000000000000000100000000000000000000000
localtransition : rust-rule
%zone : keepAlive { (0,0) }

[rust-rule]
rule : { (0,0) } 100 { (0,0) >= 90 }
rule : { 1 } 100 { (0,0) = 0 and binomial(1,0.001) = 1} 
rule : { (0,0) + binomial(1,0.125) } 100 { (-1,-1)>0 or (-1,0)>0 or (-1,1)>0 or (0,-1)>0 or (0,0)>0 or (0,1)>0 or (1,-1)>0 or (1,0)>0 or (1,1)>0 } 
rule : { (0,0) + 1 } 100 { (0,0) > 0 }
rule : { (0,0) } 100 { t } 

%[keepAlive]
%rule : { (0,0) + 1 } 100 { t } 
