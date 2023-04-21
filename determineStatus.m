function [ nextGeneration ] = determineStatus(col, row, alive, board)
    tempBoard = ones(size(board)+2);
    tempBoard(2:end-1,2:end-1) = board;

    for squares = 1:size(alive,1)
        tempBoard(alive(squares, 1)+1, alive(squares, 2)+1) = 2;
    end
    
    clc;
    tempBoard(col, row) = 3;
    nextGeneration = false;
    disp(tempBoard)
    pause(100)
end