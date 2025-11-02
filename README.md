# RP: Thermometers puzzle :thermometer:

The **Thermometers puzzle** can be described as follows: we have a grid of $n
\times n$ cells initially filled with empty thermometers. Each being a
horizontal or vertical line (of size $> 1$) or a path that includes turns, with a "bulb" at one of its ends.
The puzzle consists of filling the thermometers with mercury, starting from the
bulb and going towards their opposite end without gaps. Thermometers can be
left partially filled or even empty, but the number of cells filled with
mercury in each row and column must match the numbers shown outside the
grid  ([Try the puzzle online here!](https://www.puzzle-thermometers.com/)).

<div align="center"> <img width="500" alt="A 4x4 Thermometers puzzle showing
the initial empty grid on the left and the same grid solved with filled mercury
on the right."
src="https://github.com/user-attachments/assets/68578310-88bc-4117-bab9-aff11a398dfd"
/> <p><span style="font-size: 0.9em;"><i>Example of a classic 4x4 Thermometers puzzle.
Left: initial layout, Right: solved puzzle.</i></span></p> </div>

This assignment was developed as part of the course _Reasoning and Planning
(P4251103)_ at Universidade de Santiago de Compostela.

## Group Members

- Yago Estévez Figueiras
- Andrea Real Blanco

## Table of Contents

1.  [Requirements](#gear-requirements)
2.  [Puzzle representation](#scroll-puzzle-representation)
    * [ASCII format (`.txt`)](#1-ascii-format-txt)
    * [ASP fact format (`.lp`)](#2-asp-fact-format-lp)
3.  [Usage](#abacus-usage)

## :gear: Requirements

1. **Clingo**: To run the `.lp` programs and solve the puzzles, you will need
   to have the [Clingo](https://potassco.org/clingo/) ASP solver installed.
2. **Python 3.x**: This is required to execute all the utility scripts (for
   encoding, decoding, and, optionally, drawing the solution).
3. (Optional visualizations) Install the Python package `pygame` to visualize
   the solutions.
   ```bash
   pip install pygame
   ```

## :scroll: Puzzle representation

The initial thermometer configuration must be provided as an input file, either
in ASCII format (`.txt`) or in ASP fact format (`.lp`).

### 1. ASCII format (`.txt`)

The ASCII file must contain a square grid of $n \times n$ cells, where every line
is separated by a new line. Each cell contains a character defining the
thermometer part:

- **Thermometer bulbs** are oriented using `U` (up), `D` (down), `R` (right),
  and `L` (left).
- **Vertical body** segments can point `^` (up) or `v` (down).
- **Horizontal body** segments can point `>` (right) or `<` (left).
- **Turn segments** are represented by digits `0` (└), `1` (┏), `2` (┐), and `3` (┘).

Once the grid is complete, the **final two lines** contain the clue numbers:
The first line lists the vertical (column) counts, and the second line lists the
horizontal (row) counts separated by blank spaces.

For instance, this would be the ASCII representation for the puzzle above:
```text
<LD^
^DvU
UvDD
<Lvv
1 2 1 3
2 1 3 1
```

### 2. ASP fact format (`.lp`)

The input puzzle domain can also be provided directly using ASP facts, where
rows and columns are indexed from $0$ to $n-1$.

The encoding uses these predicates:
- **Dimensions**: `dim(n)` defines the size of the grid. The row and column
  ranges are defined as `r(0..n-1)` and `c(0..n-1)`.
- **Clues**: `row_clue(row, count)` and `col_clue(column, count)` define the
  number of filled cells per row and column.
- **Layout**: `bulb_at(row, column, orientation)`, `body_at(row, column,
  orientation)`, and `turn_at(row, column, type)` define the thermometer structure.

For the $4 \times 4$ example puzzle, the corresponding facts would be:
```lp
dim(4).
r(0..3). c(0..3).
% --- CLUES
row_clue(0,2). row_clue(1,1). row_clue(2,3). row_clue(3,1).
col_clue(0,1). col_clue(1,2). col_clue(2,1). col_clue(3,3).
% --- THERMOMETERS LAYOUT
body_at(0,0,left).
bulb_at(0,1,left).
bulb_at(0,2,down).
body_at(0,3,up).
body_at(1,0,up).
bulb_at(1,1,down).
body_at(1,2,down).
bulb_at(1,3,up).
bulb_at(2,0,up).
body_at(2,1,down).
bulb_at(2,2,down).
bulb_at(2,3,down).
body_at(3,0,left).
bulb_at(3,1,left).
body_at(3,2,down).
body_at(3,3,down).
```

Note: An alternative implementation where the orientation logic is encoded
directly into the representation (instead of handled by the constraints) is
provided through its encoder `utils/encode_alt.py` and its solver
`thermo_alt.py`.

## :abacus: Usage

The main functionalities are the encoding of the input, finding the puzzle's
solution, and the visualization of the solution.

1. **Encoding the ASCII input**. First, convert the ASCII map
   (`.txt`) into the logical facts (`.lp`) that
   Clingo can read.
   ```bash
   python3 utils/encode.py domain_example.txt domain_example.lp
   ```
2. **Solving the puzzle (Clingo)**. Now that we have the puzzle in its `.lp`
   format, we can run Clingo. To do so, we combine the puzzle facts with the
   problem's core rules and constraints (`thermo.lp`).
   ```bash
   clingo 0 thermo.lp domain_example.lp
   ```
3. **Visualize the solution**. To see the result as an image, we first need to
   translate Clingo's output into an ASCII grid of filled/empty cells (`x`/`.`)
   and then use `pygame` to draw the result.
   - Generate the **ASCII solution output**. This script outputs the solution
     state to a text file (`-sol.txt`).
     ```bash
     # This generates a file named domain_example-sol.txt
     python3 utils/decode-save-file.py thermo.lp domain_example.lp
     ```
   - Generate the **solution picture**. This script uses `pygame` to draw the
     calculated solution and saves the result as a PNG image.
     ```bash
     # This generates a file named domain_example-pic.png
     python3 utils/drawthermo.py domain_example.txt domain_example-sol.txt
     ```
