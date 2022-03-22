function root = regula_falsi(f,x0, x1, iter)
    for i = 1:iter
        f0=f(x0); %Calculating the value of function at x0
        f1=f(x1); %Calculating the value of function at x1
        y=x1-((x1-x0)/(f1-f0))*f1; %[x0,x1] is the interval of the root
        f2=f(y);
        if (f1)*(f2)<1
            x0=y;  %taking the next interval as[x0,x1] = [y,x1]
        end
    end
    root = y;
end