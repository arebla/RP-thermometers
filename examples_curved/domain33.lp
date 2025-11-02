dim(6).
r(0..5). c(0..5).
% --- CLUES
row_clue(0,3). row_clue(1,3). row_clue(2,3). row_clue(3,4). row_clue(4,2). row_clue(5,2).
col_clue(0,4). col_clue(1,1). col_clue(2,3). col_clue(3,2). col_clue(4,3). col_clue(5,4).
% --- THERMOMETERS LAYOUT
bulb_at(0,0,down).
turn_at(0,1,1).
body_at(0,2,right).
body_at(0,3,right).
turn_at(0,4,1).
bulb_at(0,5,left).
body_at(1,0,down).
turn_at(1,1,0).
turn_at(1,2,2).
body_at(1,3,up).
body_at(1,4,down).
bulb_at(1,5,down).
body_at(2,0,down).
bulb_at(2,1,right).
turn_at(2,2,3).
bulb_at(2,3,up).
body_at(2,4,down).
body_at(2,5,down).
turn_at(3,0,0).
body_at(3,1,right).
turn_at(3,2,2).
bulb_at(3,3,down).
body_at(3,4,down).
bulb_at(3,5,down).
body_at(4,0,up).
body_at(4,1,up).
body_at(4,2,down).
body_at(4,3,down).
body_at(4,4,left).
turn_at(4,5,3).
bulb_at(5,0,up).
bulb_at(5,1,up).
turn_at(5,2,0).
body_at(5,3,right).
bulb_at(5,4,right).
body_at(5,5,right).