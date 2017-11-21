%write data in notepad
function Write_Data(CELL)
for i = 1:size(CELL,1)
a = ['line',num2str(i),'.txt']; 
mat = CELL{i,1};
dlmwrite(a,mat,'delimiter',',','precision',3)
end
end