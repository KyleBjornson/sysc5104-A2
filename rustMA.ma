[top]
components : rust

[rust]
type : cell
%width : 50
%height : 50
dim : (50,50,2)
delay : transport
defaultDelayTime : 100
border : wrapped 
neighbors : rust(-1,-1,0) rust(-1,0,0) rust(-1,1,0) 
neighbors : rust(0,-1,0)  rust(0,0,0)  rust(0,1,0)
neighbors : rust(1,-1,0)  rust(1,0,0)  rust(1,1,0)
neighbors : rust(-1,-1,1) rust(-1,0,1) rust(-1,1,1) 
neighbors : rust(0,-1,1)  rust(0,0,1)  rust(0,1,1)
neighbors : rust(1,-1,1)  rust(1,0,1)  rust(1,1,1)

initialvalue : 0
initialrowvalue :  10     00000000000000000000000000100000000000000000000000
localtransition : rust-rule

zone : rust { (0,0,0)..(50,50,0) }
zone : arbiter { (0,0,1)..(50,50,1) }

[arbiter]
%rule : { 1 + randInt(7) } 0 { (0,0,-1)>0 }
rule : { 0 } 0 { t }

%[rust-rule]
[rust]
rule : { (0,0,0) } 100 { (0,0,0) >= 90 }
%rule : { 1 } 100 { (0,0) = 0 and binomial(1,0.001) = 1} 
%rule : { (0,0) + binomial(1,0.125) } 100 { (-1,-1)>0 or (-1,0)>0 or (-1,1)>0 or (0,-1)>0 or (0,0)>0 or (0,1)>0 or (1,-1)>0 or (1,0)>0 or (1,1)>0 } 
rule : { (0,0,0) + 1 } 100 { (-1,-1,1) = 8 }
rule : { (0,0,0) + 1 } 100 { (-1,0,1) = 7 }
rule : { (0,0,0) + 1 } 100 { (-1,1,1) = 6 }
rule : { (0,0,0) + 1 } 100 { (0,-1,1) = 5 }
rule : { (0,0,0) + 1 } 100 { (0,1,1) = 4 }
rule : { (0,0,0) + 1 } 100 { (1,-1,1) = 3 }
rule : { (0,0,0) + 1 } 100 { (1,0,1) = 2 }
rule : { (0,0,0) + 1 } 100 { (1,1,1) = 1 }
rule : { (0,0,0) } 100 { t } 

