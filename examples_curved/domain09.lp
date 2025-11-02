dim(6).
r(0..5). c(0..5).
% --- CLUES
row_clue(0,2). row_clue(1,3). row_clue(2,4). row_clue(3,1). row_clue(4,4). row_clue(5,3).
col_clue(0,1). col_clue(1,3). col_clue(2,3). col_clue(3,5). col_clue(4,3). col_clue(5,2).
% --- THERMOMETERS LAYOUT
turn_at(0,0,1).
body_at(0,1,right).
body_at(0,2,left).
turn_at(0,3,2).
bulb_at(0,4,right).
turn_at(0,5,2).
body_at(1,0,up).
bulb_at(1,1,right).
body_at(1,2,right).
turn_at(1,3,3).
body_at(1,4,left).
turn_at(1,5,3).
bulb_at(2,0,up).
body_at(2,1,left).
body_at(2,2,left).
body_at(2,3,left).
body_at(2,4,left).
turn_at(2,5,2).
body_at(3,0,up).
bulb_at(3,1,right).
body_at(3,2,right).
body_at(3,3,left).
turn_at(3,4,2).
bulb_at(3,5,up).
body_at(4,0,up).
bulb_at(4,1,right).
body_at(4,2,right).
body_at(4,3,right).
turn_at(4,4,3).
body_at(4,5,up).
bulb_at(5,0,up).
bulb_at(5,1,right).
body_at(5,2,right).
body_at(5,3,right).
body_at(5,4,right).
turn_at(5,5,3).