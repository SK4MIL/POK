%% Root finding method;
function result=sieczne(fx, x_1, x_2, steps)
    x1= x_1; x2 = x_2; x3=x2;
    if(steps >0)
       Y=fx([x1,x2]);
       x3 = x2-Y(2)/(Y(2)-Y(1))*(x2-x1);
       sieczne(fx,x2,x3,(steps-1))
    end
    if(steps == 0)
        result = x3;
    end
end