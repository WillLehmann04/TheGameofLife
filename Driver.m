clear;
clc;

alive = [0,0];
board = zeros(10);

figure();
imagesc(board);

finishedSetup = false;
while ~finishedSetup
    [row, col] = getClickPosition();
    fprintf("Col: %d\nRow: %d\n\n", col, row)
    if (col == 0 || row == 0)
        finishedSetup = true;
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

generation = 0;
while true
    nextGeneration = [];
    for col = 2:size(board, 1)+1
        for row = 2:size(board, 2)+1
            if (determineStatus(col, row, alive, board))
                nextGeneration = [nextGeneration; col, row];
            end
        end
    end


    alive = nextGeneration;
    displayBoard(board, alive);


    generation = generation + 1;
    fprintf("Generation: %d", generation);
    pause(1)
end

