testdata=xlsread('C:\Users\nahvi\OneDrive\Desktop\FL MP\FL (testing).xlsx');
MP=readfis('C:\Users\nahvi\OneDrive\Desktop\FL MP\MP.fis');
evalans{50}=0;
er=0;
for v = 1.0:1.0:50.0
   evalans{v}=evalfis(MP,[testdata(v,1),testdata(v,2),testdata(v,3),testdata(v,4),testdata(v,5),testdata(v,6),testdata(v,7)]);
   er=er+(abs(evalans{v}-testdata(v,8)));
end
aerr=(er/50);
fprintf('\n Average error =');
disp(aerr);