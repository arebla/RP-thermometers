dim(4).
r(0..3). c(0..3).
% --- CLUES
row_clue(0,2). row_clue(1,3). row_clue(2,1). row_clue(3,1).
col_clue(0,1). col_clue(1,3). col_clue(2,1). col_clue(3,2).
% --- THERMOMETERS LAYOUT
body_at(0,1,0,0).
body_at(0,2,0,1).
bulb_at(0,2).
body_at(1,3,0,3).
bulb_at(1,0).
bulb_at(1,1).
body_at(1,1,1,2).
body_at(2,3,1,3).
body_at(1,0,2,0).
bulb_at(2,1).
body_at(2,1,2,2).
bulb_at(2,3).
body_at(3,1,3,0).
bulb_at(3,1).
bulb_at(3,2).
body_at(3,2,3,3).