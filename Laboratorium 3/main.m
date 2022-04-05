close all;
clear;

X = [  10,   20,   30,  40,  50];
Y = [0.98, 0.93, 0.86, .76, .64];
a = zeros(1,length(X));
w = zeros(length(X));


for i = 1:length(X)
    mian = 1;
    for j = 1:length(X)
        if (j == i) 
            if(j == length(X))
                break;
            end
            j = j+1;
        end
        mian = mian .* (X(i)-X(j));
    end
    a(1,i) = Y(i)./mian;
end

for i = 1:length(X)
    for j = 1:length(X)
        if (j == i) 
            if(j == length(X))
                break;
            end
            j = j+1;
        end
        
    end
end

