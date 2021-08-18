traindata=xlsread('C:\Users\nahvi\OneDrive\Desktop\FL MP\FL (training).xlsx');
testdata=xlsread('C:\Users\nahvi\OneDrive\Desktop\FL MP\FL (testing).xlsx');
[centers,U] = fcm(traindata,3);
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
plot(traindata(index1,1),traindata(index1,2),'ob')
hold on
plot(traindata(index2,1),traindata(index2,2),'or')
plot(centers(1,1),centers(1,2),'xb','MarkerSize',15,'LineWidth',3)
plot(centers(2,1),centers(2,2),'xr','MarkerSize',15,'LineWidth',3)
plot(centers(3,1),centers(3,2),'xc','MarkerSize',15,'LineWidth',3)
hold off
er=0;
err={0,0,0};
for v = 1.0:1.0:50.0
    for c = 1.0:1.0:3.0
        for j = 1.0:1.0:7.0
            err{c}=err{c}+abs(centers(c,j)-testdata(v,j));
        end
    end
    if (err{1} < err{2}) && (err{1} < err{3})
        er=er+(abs(centers(1,8)-testdata(v,8)));
    elseif (err{2} < err{1}) && (err{2} < err{3})
        er=er+(abs(centers(2,8)-testdata(v,8)));
    else
        er=er+(abs(centers(3,8)-testdata(v,8)));
    end
end
aerr=(er/50);
fprintf('\n Average error =');
disp(aerr);