dim(4).
r(0..3). c(0..3).
% --- CLUES
row_clue(0,2). row_clue(1,3). row_clue(2,1). row_clue(3,1).
col_clue(0,1). col_clue(1,3). col_clue(2,1). col_clue(3,2).
% --- THERMOMETERS LAYOUT
body_at(0,0,left).
body_at(0,1,left).
bulb_at(0,2,left).
body_at(0,3,up).
bulb_at(1,0,down).
bulb_at(1,1,right).
body_at(1,2,right).
body_at(1,3,up).
body_at(2,0,down).
bulb_at(2,1,right).
body_at(2,2,right).
bulb_at(2,3,up).
body_at(3,0,left).
bulb_at(3,1,left).
bulb_at(3,2,right).
body_at(3,3,right).