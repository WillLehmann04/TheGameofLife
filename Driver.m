% General clean up of the workspace.
clear;      % Clears the variable list.
clc;        % Clears the console.

% General start params.
boardSize = input("Please enter a board size: ");
while ((boardSize <= 0) || (rem(boardSize,1) ~= 0)) boardSize = input("Please enter a board size: "); end % Makes sure the input is above 0 and a integer.
generationSpeed = input("Please input a generation speed (s): ");
while ((generationSpeed <= 0)) generationSpeed = input("Please input a generation speed (s): "); end % Makes sure the input is a number above 0.

% Global variables commonly needed.
alive = [0,0];                  % [0,0] needed to be able to compare the size of matrix later to remove items.
board = zeros(boardSize);       % Creates board of 0's for size boardSize x boardSize.
generation = 0;                 % Initiates the generation variable use for the main loop of the driver file
squareCounter=size(alive,1);    % Initiates the squareCounter variable use for the main loop of the driver file
figure();                       % Initiates the figure used to display the board of zeros.
imagesc(board);                 % Displays the board on the previously generated figure.


finishedSetup = false; % Purely for the loop, to determine when it should end.
while ~finishedSetup
    % Loop that gets the setup parameters.

    [row, col] = getClickPosition();    % Gets the result of the function getClickPosition for later use in the loop.
    if (col == 0 || row == 0)           % Because the output of getClickPosition is 0 if a key other than left click is pressed, this exits the loop.
        finishedSetup = true;           % Makes the loop stop, setting the loop condition to true;
    end
    if (ismember([col, row], alive, 'rows'))    % Checks to see if the col and row are a part of the alive matrix
        for i = 1:size(alive, 1)                % if it is apart of the alive matrix it loops through all alive 
            if all(alive(i,:) == [col, row])    % Search through all alive and find the index of the current row and col
                idx = i;                        % assign the index, to var idx
                break;                          % breaks out of the loop as its unnecessary to keep looping if the index has been found.
            end
        end
        alive(idx,:) = [];          % remove the row and col from alive matrix.
    else
        alive = [alive; col, row];  % add the row and col to the alive matrix.
    end
    displayBoard(board, alive);     % display the board to the current figure.
end

while ~isempty(alive)
    % Main game loop. Checks if the Alive matrix is empty, if it is it
    % stops the loop.

    nextGeneration = [];
    for col = 2:size(board, 1)+1                                % Needs to start from 2 and continue for 1 extra as a comprimise for the calculations in determineStatus.m
        for row = 2:size(board, 2)+1                            % Needs to start from 2 and continue for 1 extra as a comprimise for the calculations in determineStatus.m
            if (determineStatus(col, row, alive, board))        % Determine status checks to see if it should be alive or not next generation based off a set of rules.
                nextGeneration = [nextGeneration; col, row];    % Adds it to a temp matrix.
                squareCounter = squareCounter + 1;              % Adds 1 to the square counter for end of game statistics.
            end
        end
    end

    alive = nextGeneration;         % Sets the old alive board to equal the new alive board as the old data isn't needed.
    displayBoard(board, alive);     % Displays the new alive data.

    generation = generation + 1;                % Increments the generation variable by 1 everytime the loop runs.
    fprintf("Generation: %d", generation);      % Displays the current Generation.
    pause(generationSpeed);                     % Pauses for the determined time in the initialisation.
end
% General clean up of variables and console
clc;
close;
fprintf("Finished on generation: %d\nTotal number of squares produced: %d", generation, squareCounter); % outputs the final statistics.
