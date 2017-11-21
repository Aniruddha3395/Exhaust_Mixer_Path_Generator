function [storesort0x1,CELL] = Path_Direction(store_main)
store_main_proj= [(store_main(:,1)-store_main(:,2))/2,(store_main(:,2)-store_main(:,1))/2,store_main(:,3)];
pathpts = [zeros(size(store_main_proj,1),1),store_main_proj(:,2),store_main_proj(:,3)];
dir1 = 1;
dir2 = 2;
allpts = [pathpts(:,2),pathpts(:,3),store_main_proj(:,1),store_main];
allpts = sortrows(allpts,dir1);
flip = 0;
storeset = [];
storesort = [];
counter = 1;
for i = 1:size(allpts,1)-1
    if abs(allpts(i,dir1)-allpts(i+1,dir1))<1e-5
        storeset = [storeset;allpts(i,:)];
    else
        storeset = [storeset;allpts(i,:)];
        storeset = sortrows(storeset,dir2);
        storeset = flipud(storeset);
        if (flip/2) == round(flip/2)        %means even
            storeset = flipud(storeset);
        end
        flip = flip+1;
        CELL{counter,1}=storeset(:,4:6);
        counter = counter+1;
        storesort = [storesort;storeset];
        storeset = [];
        
    end
end
storeset = [storeset;allpts(size(allpts,1),:)];
storeset = sortrows(storeset,dir2);
% this is to get the direction of last line travel
if storesort(size(storesort,1),dir2)==storeset(1,dir2)
    storesort = [storesort;storeset];
    CELL{counter,1}=storeset(:,4:6);
else
    storeset = flipud(storeset);
    storesort = [storesort;storeset];
    CELL{counter,1}=storeset(:,4:6);
end
storesort0x1 = storesort;
end