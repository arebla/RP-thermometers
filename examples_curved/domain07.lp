dim(4).
r(0..3). c(0..3).
% --- CLUES
row_clue(0,1). row_clue(1,1). row_clue(2,3). row_clue(3,2).
col_clue(0,2). col_clue(1,2). col_clue(2,2). col_clue(3,1).
% --- THERMOMETERS LAYOUT
turn_at(0,0,1).
turn_at(0,1,2).
turn_at(0,2,1).
turn_at(0,3,2).
body_at(1,0,up).
body_at(1,1,down).
bulb_at(1,2,up).
body_at(1,3,down).
turn_at(2,0,0).
turn_at(2,1,2).
body_at(2,2,left).
bulb_at(2,3,left).
bulb_at(3,0,right).
turn_at(3,1,3).
bulb_at(3,2,right).
body_at(3,3,right).