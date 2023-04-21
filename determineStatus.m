function [ nextGeneration ] = determineStatus(col, row, alive, board)
    tempBoard = ones(size(board)+2);
    tempBoard(2:end-1,2:end-1) = board;

    for squares = 1:size(alive,1)
        tempBoard(alive(squares, 1)+1, alive(squares, 2)+1) = 2;
    end
    clc;
    tempBoard(col, row) = 3;
    totalCounter = 0;
    for i = -1:1
        for p = -1:1
            if (i == 0 && p == 0) continue; end
            %tempBoard(col+i, row+p) = 4;
            for n = 1:size(alive, 1)
                if (alive(n,1) == col+i && alive(n, 2) == row+p) totalCounter=totalCounter+1; end
            end
        end
    end
    
    isAlive = false;
    for g = 1:size(alive, 1)
        if (alive(g, 1) == col && alive(g,2) == row) isAlive = true; end
    end

    if ((isAlive && ~(totalCounter <= 1 || totalCounter >= 4)) || (~isAlive && totalCounter == 3))
        nextGeneration = true;
        return
    end
    nextGeneration = false;
end