% General clean up of the workspace.
clear;
clc;

% General start params.
boardSize = input("Please enter a board size: ");
while ((boardSize <= 0) || (rem(boardSize,1) ~= 0)) boardSize = input("Please enter a board size: "); end % Makes sure the input is above 0 and a integer.
generationSpeed = input("Please input a generation speed (s): ");
while ((generationSpeed <= 0)) generationSpeed = input("Please input a generation speed (s): "); end % Makes sure the input is a number above 0.

% Global variables commonly needed.
alive = [0,0]; % [0,0] needed to be able to compare the size of matrix later to remove items.
board = zeros(boardSize); % Creates board of 0's for size boardSize x boardSize.
figure(); % Initiates the figure used to display the board of zeros.
imagesc(board); % Displays the board on the previously generated figure.


finishedSetup = false; % Purely for the loop, to determine when it should end.
while ~finishedSetup
    % Loop that gets the setup parameters.

    [row, col] = getClickPosition(); % Gets the result of the function getClickPosition for later use in the loop.
    %fprintf("Col: %d\nRow: %d\n\n", col, row)
    if (col == 0 || row == 0) % Because the output of getClickPosition is 0 if a key other than left click is pressed, this exits the loop.
        finishedSetup = true; % Makes the loop stop, setting the loop condition to true;
    end
    if (ismember([col, row], alive, 'rows')) % Checks to see if the col and row are a part of the alive matrix
        for i = 1:size(alive, 1) % if it is apart of the alive matrix it loops through all alive 
            if all(alive(i,:) == [col, row]) % Search through all alive and find the index of the current row and col
                idx = i; % assign the index, to var idx
                break; % breaks out of the loop as its unnecessary to keep looping if the index has been found.
            end
        end
        alive(idx,:) = []; % remove the row and col from alive matrix.
    else
        alive = [alive; col, row]; % add the row and col to the alive matrix.
    end
    displayBoard(board, alive); % display the board to the current figure.
end

generation = 0;
squareCounter=size(alive,1);
while ~isempty(alive)
    nextGeneration = [];
    for col = 2:size(board, 1)+1
        for row = 2:size(board, 2)+1
            if (determineStatus(col, row, alive, board))
                nextGeneration = [nextGeneration; col, row];
                squareCounter = squareCounter + 1;
            end
        end
    end

    alive = nextGeneration;
    displayBoard(board, alive);

    generation = generation + 1;
    fprintf("Generation: %d", generation);
    pause(generationSpeed);
end
clc;
close;
fprintf("Finished on generation: %d\nTotal number of squares produced: %d", generation, squareCounter);
