dim(6).
r(0..5). c(0..5).
% --- CLUES
row_clue(0,1). row_clue(1,2). row_clue(2,2). row_clue(3,4). row_clue(4,3). row_clue(5,3).
col_clue(0,6). col_clue(1,5). col_clue(2,3). col_clue(3,0). col_clue(4,0). col_clue(5,1).
% --- THERMOMETERS LAYOUT
turn_at(0,0,1).
body_at(0,1,right).
body_at(0,2,right).
body_at(0,3,right).
body_at(0,4,left).
bulb_at(0,5,left).
turn_at(1,0,0).
bulb_at(1,1,left).
body_at(1,2,left).
body_at(1,3,left).
body_at(1,4,left).
bulb_at(1,5,left).
turn_at(2,0,1).
turn_at(2,1,2).
turn_at(2,2,1).
body_at(2,3,right).
body_at(2,4,left).
bulb_at(2,5,left).
body_at(3,0,up).
body_at(3,1,down).
body_at(3,2,up).
body_at(3,3,left).
bulb_at(3,4,left).
bulb_at(3,5,down).
body_at(4,0,up).
body_at(4,1,down).
bulb_at(4,2,up).
bulb_at(4,3,down).
turn_at(4,4,1).
body_at(4,5,down).
bulb_at(5,0,up).
turn_at(5,1,0).
body_at(5,2,right).
body_at(5,3,down).
turn_at(5,4,0).
body_at(5,5,right).