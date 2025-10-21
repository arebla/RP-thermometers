dim(6).
r(0..5). c(0..5).
% --- CLUES
row_clue(0,3). row_clue(1,3). row_clue(2,3). row_clue(3,2). row_clue(4,3). row_clue(5,3).
col_clue(0,3). col_clue(1,4). col_clue(2,1). col_clue(3,2). col_clue(4,4). col_clue(5,3).
% --- THERMOMETERS LAYOUT
body_at(0,1,0,0).
bulb_at(0,1).
body_at(0,3,0,2).
body_at(0,4,0,3).
bulb_at(0,4).
body_at(1,5,0,5).
bulb_at(1,0).
bulb_at(1,1).
body_at(1,1,1,2).
body_at(1,2,1,3).
bulb_at(1,4).
body_at(2,5,1,5).
body_at(1,0,2,0).
bulb_at(2,1).
bulb_at(2,2).
body_at(2,2,2,3).
body_at(1,4,2,4).
body_at(3,5,2,5).
body_at(2,0,3,0).
body_at(2,1,3,1).
bulb_at(3,2).
body_at(3,2,3,3).
body_at(2,4,3,4).
bulb_at(3,5).
body_at(3,0,4,0).
bulb_at(4,1).
body_at(4,1,4,2).
body_at(4,2,4,3).
body_at(3,4,4,4).
body_at(5,5,4,5).
bulb_at(5,0).
body_at(5,0,5,1).
body_at(5,1,5,2).
body_at(5,2,5,3).
body_at(4,4,5,4).
bulb_at(5,5).