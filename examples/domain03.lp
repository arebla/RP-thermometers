dim(6).
r(0..5). c(0..5).
% --- CLUES
row_clue(0,3). row_clue(1,3). row_clue(2,3). row_clue(3,2). row_clue(4,3). row_clue(5,3).
col_clue(0,3). col_clue(1,4). col_clue(2,1). col_clue(3,2). col_clue(4,4). col_clue(5,3).
% --- THERMOMETERS LAYOUT
body_at(0,0,left).
bulb_at(0,1,left).
body_at(0,2,left).
body_at(0,3,left).
bulb_at(0,4,left).
body_at(0,5,up).
bulb_at(1,0,down).
bulb_at(1,1,right).
body_at(1,2,right).
body_at(1,3,right).
bulb_at(1,4,down).
body_at(1,5,up).
body_at(2,0,down).
bulb_at(2,1,down).
bulb_at(2,2,right).
body_at(2,3,right).
body_at(2,4,down).
body_at(2,5,up).
body_at(3,0,down).
body_at(3,1,down).
bulb_at(3,2,right).
body_at(3,3,right).
body_at(3,4,down).
bulb_at(3,5,up).
body_at(4,0,down).
bulb_at(4,1,right).
body_at(4,2,right).
body_at(4,3,right).
body_at(4,4,down).
body_at(4,5,up).
bulb_at(5,0,right).
body_at(5,1,right).
body_at(5,2,right).
body_at(5,3,right).
body_at(5,4,down).
bulb_at(5,5,up).