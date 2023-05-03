function  y = vaphi(x,eps,alpha)
% for k=1:length(x)
% 
% if (-2*eps<x(k))&&(x(k)<=-eps)
%      y(k)=-((1-alpha)./eps).*(x(k)+eps)+alpha;
% elseif (-eps<x(k))&&(x(k)<=eps)
%    y(k)=alpha;
% elseif (eps<x(k)) && (x(k)<=2*eps)
%      y(k)=((1-alpha)./eps).*(x(k)-eps)+alpha;     
% else y(k)=1;
% end
% end
% 
for k=1:length(x)

if (-1.1*eps<x(k))&&(x(k)<=-eps)
     y(k)=-((1-alpha)./(0.1*eps)).*(x(k)+eps)+alpha;
elseif (-eps<x(k))&&(x(k)<=eps)
   y(k)=alpha;
elseif (eps<x(k)) && (x(k)<=1.1*eps)
     y(k)=((1-alpha)./(0.1*eps)).*(x(k)-eps)+alpha;     
else y(k)=1;
end
end


for k=1:length(x)
if (-eps<=x(k))&&(x(k)<=eps)
   y(k)=alpha;  
else y(k)=1;
end


 
end

