% thermo.lp
% Set of conditional rules and constraints for the classic and curved variant
% of the Thermometers puzzle

% NOTE: This implementation is verbose in its explicit checks for continuity.
% It could probably be simplified by encoding the mercury's
% flow direction differently

orientation(up;down;right;left).

% Rule: A cell is defined by the atoms r(R), c(C)
% The range of values for r and c should be provided in the fact file
cell(R, C) :- r(R), c(C).

% Choice rule: Each cell that contains a bulb, body, or a turn is either filled
% with mercury or not
0 { fill(R, C) } 1 :- bulb_at(R, C, _).
0 { fill(R, C) } 1 :- body_at(R, C, _).
0 { fill(R, C) } 1 :- turn_at(R, C, _).

% C1: Continuity constraints for straight segments
% We do not allow models in which a body cell is filled but its preceding
% bulb, body, or turn is not
:- body_at(R, C, up), fill(R, C), body_at(R0, C0, up), not fill(R0, C0), R0=R+1, C0=C.
:- body_at(R, C, up), fill(R, C), bulb_at(R0, C0, up), not fill(R0, C0), R0=R+1, C0=C.
:- body_at(R, C, up), fill(R, C), turn_at(R0, C0, 0), not fill(R0, C0), R0=R+1, C0=C.
:- body_at(R, C, up), fill(R, C), turn_at(R0, C0, 3), not fill(R0, C0), R0=R+1, C0=C.

:- body_at(R, C, down), fill(R, C), body_at(R0, C0, down), not fill(R0, C0), R0=R-1, C0=C.
:- body_at(R, C, down), fill(R, C), bulb_at(R0, C0, down), not fill(R0, C0), R0=R-1, C0=C.
:- body_at(R, C, down), fill(R, C), turn_at(R0, C0, 1), not fill(R0, C0), R0=R-1, C0=C.
:- body_at(R, C, down), fill(R, C), turn_at(R0, C0, 2), not fill(R0, C0), R0=R-1, C0=C.

:- body_at(R, C, right), fill(R, C), body_at(R0, C0, right), not fill(R0, C0), C0=C-1, R0=R.
:- body_at(R, C, right), fill(R, C), bulb_at(R0, C0, right), not fill(R0, C0), C0=C-1, R0=R.
:- body_at(R, C, right), fill(R, C), turn_at(R0, C0, 0), not fill(R0, C0), C0=C-1, R0=R.
:- body_at(R, C, right), fill(R, C), turn_at(R0, C0, 1), not fill(R0, C0), C0=C-1, R0=R.

:- body_at(R, C, left), fill(R, C), body_at(R0, C0, left), not fill(R0, C0), C0=C+1, R0=R.
:- body_at(R, C, left), fill(R, C), bulb_at(R0, C0, left), not fill(R0, C0), C0=C+1, R0=R.
:- body_at(R, C, left), fill(R, C), turn_at(R0, C0, 2), not fill(R0, C0), C0=C+1, R0=R.
:- body_at(R, C, left), fill(R, C), turn_at(R0, C0, 3), not fill(R0, C0), C0=C+1, R0=R.

% C1.2: Continuity constraints for curved segments

% --------------------------------------------------
% 0 Turn └ (Connects from R-1 (down) OR C+1 (left))
% --------------------------------------------------

% Vertical (R-1)
% We do not allow models in which a turn cell is filled but its
% preceding cell is not (if the mercury flows in that direction)
:- turn_at(R,C,0), fill(R,C), bulb_at(R-1,C,down), not fill(R-1,C).
:- turn_at(R,C,0), fill(R,C), body_at(R-1,C,down), not fill(R-1,C).

% When having two subsequent turns, mercury could be flowing in either direction.
% We can determine the flow by going two segments backwards. Although this does
% not result in an efficient nor elegant solution.
:- turn_at(R,C,0), fill(R,C), turn_at(R-1,C,1), not fill(R-1,C), bulb_at(R-1,C+1,left), not fill(R-1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R-1,C,1), not fill(R-1,C), body_at(R-1,C+1,left), not fill(R-1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R-1,C,2), not fill(R-1,C), bulb_at(R-1,C-1,right), not fill(R-1,C-1).
:- turn_at(R,C,0), fill(R,C), turn_at(R-1,C,2), not fill(R-1,C), body_at(R-1,C-1,right), not fill(R-1,C-1).

:- turn_at(R,C,0), fill(R,C), turn_at(R-1,C,1), not fill(R-1,C), bulb_at(R-1,C+1,left), fill(R-1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R-1,C,1), not fill(R-1,C), body_at(R-1,C+1,left), fill(R-1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R-1,C,2), not fill(R-1,C), bulb_at(R-1,C-1,right), fill(R-1,C-1).
:- turn_at(R,C,0), fill(R,C), turn_at(R-1,C,2), not fill(R-1,C), body_at(R-1,C-1,right), fill(R-1,C-1).

% Horizontal (C+1)
:- turn_at(R,C,0), fill(R,C), bulb_at(R,C+1,left), not fill(R,C+1).
:- turn_at(R,C,0), fill(R,C), body_at(R,C+1,left), not fill(R,C+1).

:- turn_at(R,C,0), fill(R,C), turn_at(R,C+1,2), not fill(R,C+1), bulb_at(R+1,C+1,up), not fill(R+1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R,C+1,2), not fill(R,C+1), body_at(R+1,C+1,up), not fill(R+1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R,C+1,3), not fill(R,C+1), bulb_at(R-1,C+1,down), not fill(R-1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R,C+1,3), not fill(R,C+1), body_at(R-1,C+1,down), not fill(R-1,C+1).

:- turn_at(R,C,0), fill(R,C), turn_at(R,C+1,2), not fill(R,C+1), bulb_at(R+1,C+1,up), fill(R+1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R,C+1,2), not fill(R,C+1), body_at(R+1,C+1,up), fill(R+1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R,C+1,3), not fill(R,C+1), bulb_at(R-1,C+1,down), fill(R-1,C+1).
:- turn_at(R,C,0), fill(R,C), turn_at(R,C+1,3), not fill(R,C+1), body_at(R-1,C+1,down), fill(R-1,C+1).

% ------------------------------------------------
% 1 Turn ┏ (Connects from R+1 (up) OR C+1 (left))
% ------------------------------------------------

% Vertical (R+1)
:- turn_at(R,C,1), fill(R,C), bulb_at(R+1,C,up), not fill(R+1,C).
:- turn_at(R,C,1), fill(R,C), body_at(R+1,C,up), not fill(R+1,C).

:- turn_at(R,C,1), fill(R,C), turn_at(R+1,C,0), not fill(R+1,C), bulb_at(R+1,C+1,left), not fill(R+1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R+1,C,0), not fill(R+1,C), body_at(R+1,C+1,left), not fill(R+1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R+1,C,3), not fill(R+1,C), bulb_at(R+1,C-1,right), not fill(R+1,C-1).
:- turn_at(R,C,1), fill(R,C), turn_at(R+1,C,3), not fill(R+1,C), body_at(R+1,C-1,right), not fill(R+1,C-1).

:- turn_at(R,C,1), fill(R,C), turn_at(R+1,C,0), not fill(R+1,C), bulb_at(R+1,C+1,left), fill(R+1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R+1,C,0), not fill(R+1,C), body_at(R+1,C+1,left), fill(R+1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R+1,C,3), not fill(R+1,C), bulb_at(R+1,C-1,right), fill(R+1,C-1).
:- turn_at(R,C,1), fill(R,C), turn_at(R+1,C,3), not fill(R+1,C), body_at(R+1,C-1,right), fill(R+1,C-1).

% Horizontal (C+1)
:- turn_at(R,C,1), fill(R,C), bulb_at(R,C+1,left), not fill(R,C+1).
:- turn_at(R,C,1), fill(R,C), body_at(R,C+1,left), not fill(R,C+1).

:- turn_at(R,C,1), fill(R,C), turn_at(R,C+1,2), not fill(R,C+1), bulb_at(R+1,C+1,up), not fill(R+1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R,C+1,2), not fill(R,C+1), body_at(R+1,C+1,up), not fill(R+1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R,C+1,3), not fill(R,C+1), bulb_at(R-1,C+1,down), not fill(R-1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R,C+1,3), not fill(R,C+1), body_at(R-1,C+1,down), not fill(R-1,C+1).

:- turn_at(R,C,1), fill(R,C), turn_at(R,C+1,2), not fill(R,C+1), bulb_at(R+1,C+1,up), fill(R+1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R,C+1,2), not fill(R,C+1), body_at(R+1,C+1,up), fill(R+1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R,C+1,3), not fill(R,C+1), bulb_at(R-1,C+1,down), fill(R-1,C+1).
:- turn_at(R,C,1), fill(R,C), turn_at(R,C+1,3), not fill(R,C+1), body_at(R-1,C+1,down), fill(R-1,C+1).


% -------------------------------------------------
% 2 Turn ┐ (Connects from R+1 (up) OR C-1 (right))
% -------------------------------------------------

% Vertical (R+1)
:- turn_at(R,C,2), fill(R,C), bulb_at(R+1,C,up), not fill(R+1,C).
:- turn_at(R,C,2), fill(R,C), body_at(R+1,C,up), not fill(R+1,C).

:- turn_at(R,C,2), fill(R,C), turn_at(R+1,C,0), not fill(R+1,C), bulb_at(R+1,C+1,left), not fill(R+1,C+1).
:- turn_at(R,C,2), fill(R,C), turn_at(R+1,C,0), not fill(R+1,C), body_at(R+1,C+1,left), not fill(R+1,C+1).
:- turn_at(R,C,2), fill(R,C), turn_at(R+1,C,3), not fill(R+1,C), bulb_at(R+1,C-1,right), not fill(R+1,C-1).
:- turn_at(R,C,2), fill(R,C), turn_at(R+1,C,3), not fill(R+1,C), body_at(R+1,C-1,right), not fill(R+1,C-1).

:- turn_at(R,C,2), fill(R,C), turn_at(R+1,C,0), not fill(R+1,C), bulb_at(R+1,C+1,left), fill(R+1,C+1).
:- turn_at(R,C,2), fill(R,C), turn_at(R+1,C,0), not fill(R+1,C), body_at(R+1,C+1,left), fill(R+1,C+1).
:- turn_at(R,C,2), fill(R,C), turn_at(R+1,C,3), not fill(R+1,C), bulb_at(R+1,C-1,right), fill(R+1,C-1).
:- turn_at(R,C,2), fill(R,C), turn_at(R+1,C,3), not fill(R+1,C), body_at(R+1,C-1,right), fill(R+1,C-1).

% Horizontal (C-1)
:- turn_at(R,C,2), fill(R,C), bulb_at(R,C-1,right), not fill(R,C-1).
:- turn_at(R,C,2), fill(R,C), body_at(R,C-1,right), not fill(R,C-1).

:- turn_at(R,C,2), fill(R,C), turn_at(R,C-1,0), not fill(R,C-1), bulb_at(R-1,C-1,down), not fill(R-1,C-1).
:- turn_at(R,C,2), fill(R,C), turn_at(R,C-1,0), not fill(R,C-1), body_at(R-1,C-1,down), not fill(R-1,C-1).
:- turn_at(R,C,2), fill(R,C), turn_at(R,C-1,1), not fill(R,C-1), bulb_at(R+1,C-1,up), not fill(R+1,C-1).
:- turn_at(R,C,2), fill(R,C), turn_at(R,C-1,1), not fill(R,C-1), body_at(R+1,C-1,up), not fill(R+1,C-1).

:- turn_at(R,C,2), fill(R,C), turn_at(R,C-1,0), not fill(R,C-1), bulb_at(R-1,C-1,down), fill(R-1,C-1).
:- turn_at(R,C,2), fill(R,C), turn_at(R,C-1,0), not fill(R,C-1), body_at(R-1,C-1,down), fill(R-1,C-1).
:- turn_at(R,C,2), fill(R,C), turn_at(R,C-1,1), not fill(R,C-1), bulb_at(R+1,C-1,up), fill(R+1,C-1).
:- turn_at(R,C,2), fill(R,C), turn_at(R,C-1,1), not fill(R,C-1), body_at(R+1,C-1,up), fill(R+1,C-1).

% ---------------------------------------------------
% 3 Turn ┘ (Connects from R-1 (down) OR C-1 (right))
% ---------------------------------------------------

% Vertical (R-1)
:- turn_at(R,C,3), fill(R,C), bulb_at(R-1,C,down), not fill(R-1,C).
:- turn_at(R,C,3), fill(R,C), body_at(R-1,C,down), not fill(R-1,C).

:- turn_at(R,C,3), fill(R,C), turn_at(R-1,C,1), not fill(R-1,C), bulb_at(R-1,C+1,left), not fill(R-1,C+1).
:- turn_at(R,C,3), fill(R,C), turn_at(R-1,C,1), not fill(R-1,C), body_at(R-1,C+1,left), not fill(R-1,C+1).
:- turn_at(R,C,3), fill(R,C), turn_at(R-1,C,2), not fill(R-1,C), bulb_at(R-1,C-1,right), not fill(R-1,C-1).
:- turn_at(R,C,3), fill(R,C), turn_at(R-1,C,2), not fill(R-1,C), body_at(R-1,C-1,right), not fill(R-1,C-1).

:- turn_at(R,C,3), fill(R,C), turn_at(R-1,C,1), not fill(R-1,C), bulb_at(R-1,C+1,left), fill(R-1,C+1).
:- turn_at(R,C,3), fill(R,C), turn_at(R-1,C,1), not fill(R-1,C), body_at(R-1,C+1,left), fill(R-1,C+1).
:- turn_at(R,C,3), fill(R,C), turn_at(R-1,C,2), not fill(R-1,C), bulb_at(R-1,C-1,right), fill(R-1,C-1).
:- turn_at(R,C,3), fill(R,C), turn_at(R-1,C,2), not fill(R-1,C), body_at(R-1,C-1,right), fill(R-1,C-1).

% Horizontal (C-1)
:- turn_at(R,C,3), fill(R,C), bulb_at(R,C-1,right), not fill(R,C-1).
:- turn_at(R,C,3), fill(R,C), body_at(R,C-1,right), not fill(R,C-1).

:- turn_at(R,C,3), fill(R,C), turn_at(R,C-1,0), not fill(R,C-1), bulb_at(R-1,C-1,down), not fill(R-1,C-1).
:- turn_at(R,C,3), fill(R,C), turn_at(R,C-1,0), not fill(R,C-1), body_at(R-1,C-1,down), not fill(R-1,C-1).
:- turn_at(R,C,3), fill(R,C), turn_at(R,C-1,1), not fill(R,C-1), bulb_at(R+1,C-1,up), not fill(R+1,C-1).
:- turn_at(R,C,3), fill(R,C), turn_at(R,C-1,1), not fill(R,C-1), body_at(R+1,C-1,up), not fill(R+1,C-1).

:- turn_at(R,C,3), fill(R,C), turn_at(R,C-1,0), not fill(R,C-1), bulb_at(R-1,C-1,down), fill(R-1,C-1).
:- turn_at(R,C,3), fill(R,C), turn_at(R,C-1,0), not fill(R,C-1), body_at(R-1,C-1,down), fill(R-1,C-1).
:- turn_at(R,C,3), fill(R,C), turn_at(R,C-1,1), not fill(R,C-1), bulb_at(R+1,C-1,up), fill(R+1,C-1).
:- turn_at(R,C,3), fill(R,C), turn_at(R,C-1,1), not fill(R,C-1), body_at(R+1,C-1,up), fill(R+1,C-1).

% C2: We do not allow models in which the number of filled cells for row R is
% different than Clue
:- row_clue(R, Clue), Clue != #count{C: fill(R, C)}.

% C3: We do not allow models in which the number of filled cells for column C
% is different than Clue
:- col_clue(C, Clue), Clue != #count{R: fill(R, C)}.

% Show only predicates of type fill(R,C)
#show fill/2.
