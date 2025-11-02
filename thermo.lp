% thermo.lp
% Set of conditional rules and constraints for the Thermometers puzzle

orientation(up;down;right;left).

% Rule: A cell is defined by the atoms r(R), c(C)
% The range of values for r and c should be provided in the fact file
cell(R, C) :- r(R), c(C).

% Choice rule: Each cell that contains a body or a bulb is either filled with
% mercury or not
0 { fill(R, C) } 1 :- bulb_at(R, C, _).
0 { fill(R, C) } 1 :- body_at(R, C, _).

% --- Constraints:
% C1: We do not allow models in which a body cell is filled but its preceding
% bulb or body is not
:- body_at(R, C, up), fill(R, C), body_at(R0, C0, up), not fill(R0, C0), R0=R+1, C0=C.
:- body_at(R, C, up), fill(R, C), bulb_at(R0, C0, up), not fill(R0, C0), R0=R+1, C0=C.

:- body_at(R, C, down), fill(R, C), body_at(R0, C0, down), not fill(R0, C0), R0=R-1, C0=C.
:- body_at(R, C, down), fill(R, C), bulb_at(R0, C0, down), not fill(R0, C0), R0=R-1, C0=C.

:- body_at(R, C, right), fill(R, C), body_at(R0, C0, right), not fill(R0, C0), C0=C-1, R0=R.
:- body_at(R, C, right), fill(R, C), bulb_at(R0, C0, right), not fill(R0, C0), C0=C-1, R0=R.

:- body_at(R, C, left), fill(R, C), body_at(R0, C0, left), not fill(R0, C0), C0=C+1, R0=R.
:- body_at(R, C, left), fill(R, C), bulb_at(R0, C0, left), not fill(R0, C0), C0=C+1, R0=R.


% C2: We do not allow models in which the number of filled cells for row R is
% different than Clue
:- row_clue(R, Clue), Clue != #count{C: fill(R, C)}.

% C3: We do not allow models in which the number of filled cells for column C
% is different than Clue
:- col_clue(C, Clue), Clue != #count{R: fill(R, C)}.

% Show only predicates of type fill(R,C)
#show fill/2.
