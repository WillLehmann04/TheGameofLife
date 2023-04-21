function [] = displayBoard(board, alive)
    % Function to display all the alive matrix on the board and into the
    % figure.
    for col = 1:size(board,1)                                   % Loop through every col 
        for row = 1:size(board,2)                               % Loop through every row 
            for l = 1:size(alive, 1)                            % Loop through every item in alive.
                if (alive(l, 1) == col && alive (l, 2) == row)  % If the col and row match something in alive move inside if statment
                    board(col, row) = 2;                        % change the value of it to 2.
                end
            end
        end
    end
    imagesc(board);     % Override the current figure with new details.
end