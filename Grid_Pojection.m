function [store_main] = Grid_Pojection(v,f,pts_proj)
store_main = [];        %to store all the projected points
for i=1:size(f,1)
p1 = v(f(i,1),:);
p2 = v(f(i,2),:);
p3 = v(f(i,3),:);
tri = [p1;p2;p3;p1];        %forming triangle
tri_proj = [(tri(:,1)-tri(:,2))/2,(tri(:,2)-tri(:,1))/2,tri(:,3)];      %projecting triangle on plane
in = inpolygon(pts_proj(:,2),pts_proj(:,3),tri_proj(:,2),tri_proj(:,3));    %finding points inside plane
loc = find(in);                 %finding their location
store = [pts_proj(loc,2),pts_proj(loc,3)];
store = [zeros(size(store,1),1),store(:,1),store(:,2)];
store = [pts_proj(loc,1),pts_proj(loc,2),pts_proj(loc,3)];
if isempty(store)==1
continue;
else
a = ((p2(2)-p1(2))*(p3(3)-p1(3)))-((p3(2)-p1(2))*(p2(3)-p1(3)));
b = ((p2(3)-p1(3))*(p3(1)-p1(1)))-((p3(3)-p1(3))*(p2(1)-p1(1)));
c = ((p2(1)-p1(1))*(p3(2)-p1(2)))-((p3(1)-p1(1))*(p2(2)-p1(2)));
d = -(a*p1(1))-(b*p1(2))-(c*p1(3));
for i = 1:size(store,1)
project(i,1) = (-d-c*store(i,3)-2*b*store(i,2))/(a+b);
project(i,2) = project(i,1)+2*store(i,2);
project(i,3) = store(i,3);
end
end
store_main = [store_main;project];
end
end
