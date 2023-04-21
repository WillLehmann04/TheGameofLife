alive = [0,0];
board = zeros(20);

disp (board)

figure();
imagesc(board);

finishedSetup = false;
while ~finishedSetup
    [row, col] = getClickPosition();
    fprintf("Col: %d\nRow: %d\n\n", col, row)
    if (col == 0 || row == 0)
        finishedSetup = true;
        return
    end
    if (ismember([col, row], alive, 'rows'))
        alive(col, row) = [];
        continue;
    end
    alive = [alive; col, row];
    

    %temp
    board(col, row) = 1;
    imagesc(board);
end

