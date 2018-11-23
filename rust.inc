#BeginMacro(Rustable)
(0,0,0) < 90
#EndMacro

#BeginMacro(isCellRusty)
(0,0,-1) > 0 
#EndMacro

#BeginMacro(delayRandomizer)
100*randInt(1)
#EndMacro

#BeginMacro(fullNeighborCheck)
(0,0,-1) = 90 and (-1,-1,-1) = 90 and (-1,0,-1) = 90 and (-1,1,-1) = 90 and (0,-1,-1) = 90 and (0,1,-1) = 90 and (1,-1,-1) = 90 and (1,0,-1) = 90 and (1,1,-1) = 90
#EndMacro

#BeginMacro(leftEdgeNeighborCheck)
(0,0,-1) = 90 and (0,-1,-1) = 90 and (0,1,-1) = 90 and (1,-1,-1) = 90 and (1,0,-1) = 90 and (1,1,-1) = 90
#EndMacro

#BeginMacro(rightEdgeNeighborCheck)
(0,0,-1) = 90 and (-1,-1,-1) = 90 and (-1,0,-1) = 90 and (-1,1,-1) = 90 and (0,-1,-1) = 90 and (0,1,-1) = 90
#EndMacro

#BeginMacro(topEdgeNeighborCheck)
(0,0,-1) = 90 and (-1,0,-1) = 90 and (-1,1,-1) = 90 and (0,1,-1) = 90 and (1,0,-1) = 90 and (1,1,-1) = 90
#EndMacro

#BeginMacro(bottomEdgeNeighborCheck)
(0,0,-1) = 90 and (-1,-1,-1) = 90 and (-1,0,-1) = 90 and (0,-1,-1) = 90 and (1,-1,-1) = 90 and (1,0,-1) = 90
#EndMacro