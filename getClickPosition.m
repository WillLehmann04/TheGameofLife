function [roundedx, roundedy] = getClickPosition()
    % Function to get the users click position and determine its
    % coordinates.
    [col, row, key] = ginput(1); % Retrieves key, x and y coords of user input.
    if (key~=1) roundedx=0;roundedy=0;return; end % If the key is anything but left click, stop running.
    roundedx = round(col); roundedy = round(row); % Output the final x and y coordinates of user click.
end