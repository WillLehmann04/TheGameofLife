function [] = displayBoard(board, alive)
    for col = 1:size(board,1)
        for row = 1:size(board,2)
            if (ismember([col, row], alive, 'rows'))
                board(col, row) = 1;
            end
        end
    end
    imagesc(board);
end