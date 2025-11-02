import clingo
import sys

ORIENTATIONS = {
    '^': 'up',    # Body up
    'v': 'down',  # Body down
    '>': 'right', # Body right
    '<': 'left',  # Body left
    'U': 'up',    # Bulb up
    'D': 'down',  # Bulb down
    'R': 'right', # Bulb right
    'L': 'left',  # Bulb left
}

BULB_CHARS = ['U', 'D', 'R', 'L']
BODY_CHARS = ['^', 'v', '>', '<']
TURN_CHARS = ['0', '1', '2', '3']

def encode_thermometers(input_file, output_file):
    """
    Given a file containing the initial configuration of a thermometers puzzle,
    encodes the corresponding constants and set of facts in Clingo format.

    Args:
        input_file (str): Path to the puzzle input file, e.g., "dom01.txt".
        output_file (str): Name of the output Clingo file, e.g., "dom01.lp".
    """
    try:
        with open(input_file, 'r') as file:
            lines = [line.strip() for line in file.readlines()]
    except FileNotFoundError:
        print(f"Error: Input file '{input_file}' not found.", file=sys.stderr)
        return

    assert lines, "Error: Grid is empty."

    row_clues = lines.pop().split()
    col_clues = lines.pop().split()

    assert len(row_clues) == len(col_clues), \
        f"Error: Row clue count ({len(row_clues)}) does not match number of column clues ({len(col_clues)})."

    assert all(len(line) == len(row_clues) for line in lines), \
        f"Error: Not all lines have the same length. Expected {len(row_clues)}x{len(col_clues)} grid."

    assert len(lines) == len(row_clues), \
        f"Error: Grid is not square. {len(lines)} rows, {len(col_clues)} columns."

    facts = []
    dim = len(row_clues)
    facts.append(f'dim({dim}).')
    facts.append(f'r(0..{dim-1}). c(0..{dim-1}).')

    facts.append('% --- CLUES')
    facts.append(" ".join(f"row_clue({idx},{num})." for idx, num in enumerate(row_clues)))
    facts.append(" ".join(f"col_clue({idx},{num})." for idx, num in enumerate(col_clues)))

    facts.append('% --- THERMOMETERS LAYOUT')
    for r, line in enumerate(lines):
        for c, char in enumerate(line):
            if char in BULB_CHARS:
                facts.append(f'bulb_at({r},{c},{ORIENTATIONS[char]}).')
            elif char in BODY_CHARS:
                facts.append(f'body_at({r},{c},{ORIENTATIONS[char]}).')
            elif char in TURN_CHARS:
                facts.append(f'turn_at({r},{c},{char}).')
            else:
                raise ValueError(
                    f"Invalid character '{char}' found at position ({r}, {c}) "
                    f"in the grid. Allowed characters are: {', '.join(BULB_CHARS + BODY_CHARS + TURN_CHARS)}."
                )

    with open(output_file, 'w') as out_file:
        out_file.write('\n'.join(facts))
    print(f"Successfully encoded '{input_file}' to '{output_file}'.")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Usage: python3 {sys.argv[0]} <input_ascii_file> <output_domain_lp>", file=sys.stderr)
    else:
        encode_thermometers(sys.argv[1], sys.argv[2])
