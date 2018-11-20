[top]
components : rust

[rust]
type : cell

dim : (20,20,2)
delay : inertial
defaultDelayTime : 100
border : nowrapped 
neighbors : rust(-1,-1,0) rust(-1,0,0) rust(-1,1,0) 
neighbors : rust(0,-1,0)  rust(0,0,0)  rust(0,1,0)
neighbors : rust(1,-1,0)  rust(1,0,0)  rust(1,1,0)
neighbors : rust(-1,-1,1) rust(-1,0,1) rust(-1,1,1) 
neighbors : rust(0,-1,1)  rust(0,0,1)  rust(0,1,1)
neighbors : rust(1,-1,1)  rust(1,0,1)  rust(1,1,1)
neighbors : rust(0,0,-1)

initialvalue : 0
initialcellsvalue : initial.val

zone : rust-zone { (0,0,0)..(19,19,0) }
zone : arbiter { (0,0,1)..(19,19,1) }

[arbiter] %Keep the cells awake, they might be needed!
rule : { 1 + randInt(7) } 100 { (0,0,-1)>0 }
rule : { 0 } 100 { (0,0,-1) = 0 }

[rust-zone]
rule : { (0,0,0) + 1 } 100 { (-1,-1,1) = 8 and (0,0,0) < 90}
rule : { (0,0,0) + 1 } 100 { (-1,0,1) = 7 and (0,0,0) < 90}
rule : { (0,0,0) + 1 } 100 { (-1,1,1) = 6 and (0,0,0) < 90}
rule : { (0,0,0) + 1 } 100 { (0,-1,1) = 5 and (0,0,0) < 90}
rule : { (0,0,0) + 1 } 100 { (0,1,1) = 4 and (0,0,0) < 90}
rule : { (0,0,0) + 1 } 100 { (1,-1,1) = 3 and (0,0,0) < 90}
rule : { (0,0,0) + 1 } 100 { (1,0,1) = 2 and (0,0,0) < 90}
rule : { (0,0,0) + 1 } 100 { (1,1,1) = 1 and (0,0,0) < 90}
rule : { (0,0,0) } 100 { (0,0,0) >= 90 }
rule : { (0,0,0) } 100 { t }