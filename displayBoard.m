function [] = displayBoard(board, alive)
    for col = 1:size(board,1)
        for row = 1:size(board,2)
            for l = 1:size(alive, 1)
                if (alive(l, 1) == col && alive (l, 2) == row)
                    board(col, row) = 2;
                end
            end
        end
    end
    imagesc(board);
end