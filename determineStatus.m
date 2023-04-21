function [ nextGeneration ] = determineStatus(col, row, alive, board)
    % determineStatus determines whether the col, row (coordinates) should
    % be alive or dead.
    
    % General variables.
    totalCounter = 0;
    tempBoard = ones(size(board)+2);    % Creates a temp board 2 bigger than the size of the actual game board.
    tempBoard(2:end-1,2:end-1) = board; % Sets the gameboard inside the tempBoard.
                                        
                                        % Example if above:
                                        % 1 1 1 1 1 1 1 1 1
                                        % 1 0 0 0 0 0 0 0 1
                                        % 1 0 0 0 0 0 0 0 1
                                        % 1 0 0 0 0 0 0 0 1
                                        % 1 0 0 0 0 0 0 0 1
                                        % 1 1 1 1 1 1 1 1 1


    for i = -1:1            % For one behind, the current col, and one front square.
        for p = -1:1        % For one behind, the current col, and one front square.

                            % These two foreloops create a loop that looks like:
                            % 1 1 1
                            % 1 0 1
                            % 1 1 1

            if (i == 0 && p == 0) continue; end % Ensures it skips its self thus not adding 1 to the total counter if it's a live cell.
            for n = 1:size(alive, 1)                                                                % Loops through every curerntly alive cells.
                if (alive(n,1) == col+i && alive(n, 2) == row+p) totalCounter=totalCounter+1; end   % for every live square in the surrounding squares add one to totalCounter.
            end
        end
    end
    
    if ismember([col, row], alive, 'rows') isAlive = true; else isAlive = false; end % Determines whether the current row and col is previously alive.

    if ((isAlive && ~(totalCounter <= 1 || totalCounter >= 4)) || (~isAlive && totalCounter == 3)) % Rules for determining whether the cell is alive or dead.
        nextGeneration = true;      % Cell is alive
        return
    end
    nextGeneration = false;         % Cell is dead.
end