[top]
components : rust

[rust]
type : cell

dim : (20,20,2)
delay : transport
defaultDelayTime : 100
border : wrapped 
neighbors : rust(-1,-1,0) rust(-1,0,0) rust(-1,1,0) 
neighbors : rust(0,-1,0)  rust(0,0,0)  rust(0,1,0)
neighbors : rust(1,-1,0)  rust(1,0,0)  rust(1,1,0)
neighbors : rust(0,0,1) 

initialvalue : 0
initialcellsvalue : initial.val

zone : rust-zone { (0,0,0)..(19,19,0) }
zone : arbiter { (0,0,1)..(19,19,1) }

[arbiter] %Keep the cells awake, they might be needed!
rule : { (0,0,0) + 1 } 100 { t }

[rust-zone]
rule : { (0,0,0) + binomial(1,0.125) } 100 { (0,0,0) < 90 and ( (-1,-1,0)>0 or (-1,0,0)>0 or (-1,1,0)>0 or (0,-1,0)>0 or (0,0,0)>0 or (0,1,0)>0 or (1,-1,0)>0 or (1,0,0)>0 or (1,1,0)>0 ) } 
rule : { (0,0,0) } 100 { (0,0,0) >= 90 }
rule : { (0,0,0) + 1} 100 { t }