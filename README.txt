=======================================================
Lab Assigment #1 - Thermometers Puzzle
Course: Reasoning and Planning (P4251103)
=======================================================

1. GROUP MEMBERS
----------------
- Yago Estévez Figueiras
- Andrea Real Blanco

2. SUMMARY
----------
An Answer Set Programming (ASP) solver for the Thermometers puzzle, supporting
both the classic and the curved variant.

NOTES:
- The 'thermo_curved.lp' file can correctly solve puzzles of either the classic
  or the curved variant, while the 'thermo.lp' contains only the standard
  puzzle rules and constraints.
- An alternative implementation where the orientation logic is encoded directly
  into the representation (instead of handled by the constraints) is also
  provided through its encoder 'utils/encode_alt.py' and its solver 'thermo_alt.lp'.

3. USAGE INSTRUCTIONS
---------------------
To run and solve a puzzle, the following steps are required:

A. REQUIREMENTS:
- Clingo (to run the .lp programs and solve the puzzles).
- Python 3.x (for the utility scripts).
- (Optional) Python 'pygame' package for solution visualization.

B. ENCODING THE ASCII INPUT:
Convert the puzzle's ASCII map (.txt) into the logical facts (.lp) that Clingo
can read.
- Command:
    python3 utils/encode.py [input_file.txt] [output_file.lp]
- Example:
    python3 utils/encode.py domain_example.txt domain_example.lp

C. SOLVING THE PUZZLE (CLINGO):
Combine the generated puzzle facts with the problem's core rules and constraints
(thermo.lp).
- Command:
    clingo 0 thermo.lp [puzzle_file.lp]
- Example:
    clingo 0 thermo.lp domain_example.lp

D. VISUALIZING THE SOLUTION (Optional):
1. Generate the ASCII solution output (-sol.txt):
    python3 utils/decode-save-file.py thermo.lp [puzzle_file.lp]
2. Generate the solution picture (-pic.png):
    python3 utils/drawthermo.py [input_file.txt] [solution_file-sol.txt]
