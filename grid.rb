class Grid
    def initialize
        @turn = CONST_X
        @boards = {X: 0b0_00000000, O: 0b0_00000000}
    end

    def make_move(mx, my)
        grid_square = (my.to_i / CELL_SIZE) * 3 + (mx.to_i / CELL_SIZE)
        digit = 2 ** grid_square

        if @boards[CONST_X] & digit != digit and @boards[CONST_O] & digit != digit
            @boards[@turn] += digit
            return true
        else
            return false
        end
    end

    def check_game_over
        for i in (0...GAME_OVER_STATES.length - 1)
            if @boards[@turn] & GAME_OVER_STATES[i] == GAME_OVER_STATES[i]
                return 1 # Win
            end
        end
    
        if @boards[CONST_X] + @boards[CONST_O] == GAME_OVER_STATES[GAME_OVER_STATES.length - 1]
            return 0 # Draw
        else
            return -1 # Continue
        end
    end

    def switch_turn
        @turn == CONST_X ? @turn = CONST_O : @turn = CONST_X
    end

    def draw
        GRID_IMAGE.draw(0, 0, 0)

        for i in (0..9)
            digit = 2 ** i
            x_pos = i % 3 * CELL_SIZE
            y_pos = i / 3 * CELL_SIZE

            if @boards[CONST_X] & digit == digit 
                X_IMAGE.draw(x_pos, y_pos, 0)
            elsif @boards[CONST_O] & digit == digit
                O_IMAGE.draw(x_pos, y_pos, 0)
            end
        end        
    end

    def reset
        @turn = CONST_X
        @boards[CONST_X] = @boards[CONST_O] = 0b0_00000000
    end
end

