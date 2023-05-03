function y = g_God_LWR(u,v)
if v<=u
    if (v<=1/2)&&(1/2<=u) 
        y=1/4;
    elseif (v<=1/2)&&(u<1/2) 
        y=u*(1-u);
    elseif (0<v)&&(0<=u) 
        y=v*(1-v);
    end 
else 
    y=min(v*(1-v),u*(1-u));
end 
end

