alive = [];
board = zeros(20);

disp (board)

figure();
imagesc(board);

finishedSetup = false;
while ~finishedSetup
    [col, row] = getClickPosition();
    if (col == 0 || row == 0)
        finishedSetup = true;
        return
    end
end

