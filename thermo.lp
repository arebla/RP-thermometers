% thermo.lp
% Set of conditional rules and constraints for the Thermometers puzzle

% Rule: A cell is defined by the atoms r(R), c(C)
% The range of values for r and c should be provided in the fact file
cell(R, C) :- r(R), c(C).

% Choice rule: Each cell is either filled with mercury or not
0 { fill(R, C) } 1 :- cell(R, C).

% -- Constraints:
% C1: We do not allow models in which a body cell is filled but its predecessor
% is not
% Note that the conjunction of body_at's leads to bulb_at
:- body_at(R0, C0, R, C), fill(R, C), not fill(R0, C0).

% C2: We do not allow models in which the number of filled cells for row R is
% different than Clue
:- row_clue(R, Clue), Clue != { fill(R, C) : c(C) }.

% C3: We do not allow models in which the number of filled cells for column C
% is different than Clue
:- col_clue(C, Clue), Clue != { fill(R, C) : r(R) }.

% Show one solution
#show fill/2.
