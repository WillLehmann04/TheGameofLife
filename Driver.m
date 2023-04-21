alive = [];
board = zeros(20);

disp (board)

figure();
imagesc(board);

finishedSetup = false;
while ~finishedSetup
    setup();
end