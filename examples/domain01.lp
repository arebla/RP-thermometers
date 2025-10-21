dim(4).
r(0..3). c(0..3).
% --- CLUES
row_clue(0,1). row_clue(1,3). row_clue(2,2). row_clue(3,1).
col_clue(0,3). col_clue(1,2). col_clue(2,1). col_clue(3,1).
% --- THERMOMETERS LAYOUT
body_at(0,0,up).
bulb_at(0,1,right).
body_at(0,2,right).
body_at(0,3,right).
bulb_at(1,0,up).
bulb_at(1,1,right).
body_at(1,2,right).
bulb_at(1,3,down).
bulb_at(2,0,down).
bulb_at(2,1,down).
bulb_at(2,2,down).
body_at(2,3,down).
body_at(3,0,down).
body_at(3,1,down).
body_at(3,2,down).
body_at(3,3,down).