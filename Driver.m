clear;
clc;

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
        for i = 1:size(alive, 1)
            if all(alive(i,:) == [col, row])
                idx = i;
                break;
            end
        end
        alive(idx,:) = [];
    else
        alive = [alive; col, row];
    end
    displayBoard(board, alive);
end

while 1

pause(1);
end

