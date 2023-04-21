function [roundedx, roundedy] = getClickPosition()
    [col, row, key] = ginput(1);
    if (key~=1) roundedx=0;roundedy=0;return; end
    roundedx = round(col); roundedy = round(row);
end