#include(rust.inc)

[top]
components : rust
components : incident1@rustIncident

Link : incidentRustOut@incident1 in@rust

[rust]
type : cell

dim : (20,20,2)
delay : inertial
defaultDelayTime : 100
border : nowrapped 
in : in
link : in in@rust(5,5,0)
portInTransition : in@rust(5,5,0) incidentRust

neighbors : rust(-1,-1,0) rust(-1,0,0) rust(-1,1,0) 
neighbors : rust(0,-1,0)  rust(0,0,0)  rust(0,1,0)
neighbors : rust(1,-1,0)  rust(1,0,0)  rust(1,1,0)
neighbors : rust(-1,-1,1) rust(-1,0,1) rust(-1,1,1) 
neighbors : rust(0,-1,1)  rust(0,0,1)  rust(0,1,1)
neighbors : rust(1,-1,1)  rust(1,0,1)  rust(1,1,1)
neighbors : rust(-1,-1,-1) rust(-1,0,-1) rust(-1,1,-1) 
neighbors : rust(0,-1,-1)  rust(0,0,-1)  rust(0,1,-1)
neighbors : rust(1,-1,-1)  rust(1,0,-1)  rust(1,1,-1)

initialvalue : 0

%Main rust zone, visual layer
zone : rust-zone { (0,0,0)..(19,19,0) }

%Arbiter is used to decide which direction the rust will spread
zone : arbiter-middle { (1,1,1)..(18,18,1) }
zone : arbiter-leftEdge { (0,1,1)..(0,18,1) }
zone : arbiter-rightEdge { (19,1,1)..(19,18,1) }
zone : arbiter-topEdge { (1,0,1)..(18,0,1) }
zone : arbiter-bottomEdge { (1,19,1)..(18,19,1) }
zone : arbiter-topLeftCorner { (0,0,1) }
zone : arbiter-topRightCorner { (19,0,1) }
zone : arbiter-bottomLeftCorner { (0,19,1) }
zone : arbiter-bottomRightCorner { (19,19,1) }

[incidentRust]
rule : { (0,0,0) + portValue(thisPort) } 100 { #macro(Rustable) }
rule : { (0,0,0) } 100 { t }

% Arbiter selects cell around it given this scheme
% -------------
% | 1 | 2 | 3 |
% -------------
% | 4 |   | 5 |
% -------------
% | 6 | 7 | 8 |
% -------------
[arbiter-middle] %All 8 neighbors available for rust to spread to.
rule : { round(uniform(1,8)) } 100 { #macro(isCellRusty) and #macro(fullNeighborCheck) }
rule : { 0 } 100 { t }

[arbiter-leftEdge] % 5 neighbors (2,3,5,7,8) **Random selection imperfect
rule : { round(uniform(2,8)) } 100 { #macro(isCellRusty) }
rule : { 0 } 100 { not #macro(isCellRusty) }

[arbiter-rightEdge] % 5 neighbors (2,3,5,7,8) **Random selection imperfect
rule : { round(uniform(1,7)) } 100 { #macro(isCellRusty) }
rule : { 0 } 100 { not #macro(isCellRusty) }

[arbiter-topEdge] % 5 neighbors (4,5,6,7,8)
rule : { round(uniform(4,8)) } 100 { #macro(isCellRusty) }
rule : { 0 } 100 { not #macro(isCellRusty) }

[arbiter-bottomEdge] % 5 neighbors (1,2,3,4,5)
rule : { round(uniform(1,5)) } 100 { #macro(isCellRusty) }
rule : { 0 } 100 { not #macro(isCellRusty) }

[arbiter-topLeftCorner] %3 neighbors (5,7,8) **Random selection imperfect
rule : { round(uniform(5,8)) } 100 { #macro(isCellRusty) }
rule : { 0 } 100 { not #macro(isCellRusty) }

[arbiter-topRightCorner] %3 neighbors (4,6,7) **Random selection imperfect
rule : { round(uniform(4,7)) } 100 { #macro(isCellRusty) }
rule : { 0 } 100 { not #macro(isCellRusty) }

[arbiter-bottomLeftCorner] %3 neighbors (2,3,5) **Random selection imperfect
rule : { round(uniform(2,5)) } 100 { #macro(isCellRusty) }
rule : { 0 } 100 { not #macro(isCellRusty) }

[arbiter-bottomRightCorner] %3 neighbors (1,2,4) **Random selection imperfect
rule : { round(uniform(1,4)) } 100 { #macro(isCellRusty) }
rule : { 0 } 100 { not #macro(isCellRusty) }

[rust-zone]
rule : { (0,0,0) + 1 } { 100 + #macro(delayRandomizer) } { (-1,-1,1) = 8 and #macro(Rustable) }
rule : { (0,0,0) + 1 } { 100 + #macro(delayRandomizer) } { (-1,0,1) = 7 and #macro(Rustable) }
rule : { (0,0,0) + 1 } { 100 + #macro(delayRandomizer) } { (-1,1,1) = 6 and #macro(Rustable) }
rule : { (0,0,0) + 1 } { 100 + #macro(delayRandomizer) } { (0,-1,1) = 5 and #macro(Rustable) }
rule : { (0,0,0) + 1 } { 100 + #macro(delayRandomizer) } { (0,1,1) = 4 and #macro(Rustable) }
rule : { (0,0,0) + 1 } { 100 + #macro(delayRandomizer) } { (1,-1,1) = 3 and #macro(Rustable) }
rule : { (0,0,0) + 1 } { 100 + #macro(delayRandomizer) } { (1,0,1) = 2 and #macro(Rustable) }
rule : { (0,0,0) + 1 } { 100 + #macro(delayRandomizer) } { (1,1,1) = 1 and #macro(Rustable) }

rule : { (0,0,0) } 100 { (0,0,0) >= 90 } %Can't rust anymore
rule : { (0,0,0) } 100 { t }