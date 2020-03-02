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
end

