function [pts_proj] = GridPoints(xmax,zmax,ptsgap)

%point grid
pts = [];
for i = -100:ptsgap:ceil(xmax)
    j = [-100:ptsgap:ceil(zmax)]';
    pts= [pts;[[i*ones(size(j,1),1)],j]];
end
q = [pts(:,1),zeros(size(pts,1),1),pts(:,2)+100];
pts_proj = [(q(:,1)-q(:,2))/2,(q(:,2)-q(:,1))/2,q(:,3)];

end