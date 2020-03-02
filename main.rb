require "ruby2d"

# Constants
CELL_SIZE = 64
CONST_X, CONST_O = :X, :O
GAME_OVER_STATES = [
    0b0_0000_0111, 0b0_0011_1000, 0b1_1100_0000, # Horizontal Wins
    0b0_0100_1001, 0b0_1001_0010, 0b1_0010_0100, # Vertical Wins
    0b1_0001_0001, 0b0_0101_0100, 0b1_1111_1111  # Diagonal Wins + Draw State
]
IMAGE_PATHS = {X: "char_x.png", O: "char_o.png"}

# Game Variable Setup
turn = CONST_X
grids = {X: 0b000000000, O: 0b000000000}
game_over = false

# Graphics Setup
Image.new("grid.png")
cell_images = Array.new(9)

# Set Window
set title: "Tic-Tac-2", width: CELL_SIZE * 3, height: CELL_SIZE  * 3

# Functions
def make_move(grids, turn, cell_images)
    square = (Window.mouse_y / CELL_SIZE) * 3 + (Window.mouse_x / CELL_SIZE)
    digit = 2 ** square

    if grids[CONST_X] & digit != digit and grids[CONST_O] & digit != digit
        grids[turn] += digit

        cell_images[square] = Image.new(
            IMAGE_PATHS[turn],
            x: square % 3 * CELL_SIZE,
            y: square / 3 * CELL_SIZE
        )

        return true
    else
        return false
    end
end

def check_game_over(grids, turn)
    for i in (0...GAME_OVER_STATES.length - 1)
        if grids[turn] & GAME_OVER_STATES[i] == GAME_OVER_STATES[i]
            return 1 # Win
        end
    end

    if grids[CONST_X] + grids[CONST_O] == GAME_OVER_STATES[GAME_OVER_STATES.length - 1]
        return 0 # Draw
    else
        return -1 # Continue
    end
end

def switch_turn(turn)
    turn == CONST_X ? CONST_O : CONST_X
end

# Click Event
on :mouse_up do |event|
    if event.button == :left and not game_over
        if make_move(grids, turn, cell_images)
            if check_game_over(grids, turn) == -1
                turn = switch_turn(turn)
            else
                game_over = true
            end
        end
    end
end

show
