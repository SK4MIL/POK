

close all;
clear;

X = [  10,   20,   30,  40,  50];
Y = [0.98, 0.93, 0.86, .76, .64];
a = zeros(1,length(X));
w = zeros(length(X)-1);

xx = 0:0.5:60;
yy=spline(X,Y,xx);

for i = 1:length(X)
    mian = 1;
    k = 1;
    for j = 1:length(X)
        if (j == i) 
%             if(j == length(X))
%                 break;
%             end
            continue;
        else
            mian = mian .* (X(i)-X(j));
%             mian = mian .* (X(i)-X(j));
        end
        k=k+1;
    end
    a(1,i) = Y(i)./mian;
end

for i = 1:length(X)
    k = 1;
    for j = 1:(length(X))
        if (j == i) 
            continue;
        else
            w(i,k) = (X(j));
        end
        k = k+1;
    end
end

f = @(x) ... 
    (a(1).*(x-w(1,1)).*(x-w(1,2)).*(x-w(1,3)).*(x-w(1,4))) + ...
    (a(2).*(x-w(2,1)).*(x-w(2,2)).*(x-w(2,3)).*(x-w(2,4))) + ...
    (a(3).*(x-w(3,1)).*(x-w(3,2)).*(x-w(3,3)).*(x-w(3,4))) + ...
    (a(4).*(x-w(4,1)).*(x-w(4,2)).*(x-w(4,3)).*(x-w(4,4))) + ...
    (a(5).*(x-w(5,1)).*(x-w(5,2)).*(x-w(5,3)).*(x-w(5,4)));

t = 0:60;
figure(1);
plot(f(t));
hold on;
plot(xx,yy, 'black--')
plot(X,Y, '*r');
legend(["Wielomian","Spline", "Punkty"]);
