function y= v(u)
%F Summary of this function goes here
%   Detailed explanation goes here
% if 1<=u
%     y=0;
% else 
%     y=(exp(1)+1)./(1+exp(1./(1-u)));
% end 



if u>1 
   y=0;
elseif u<0
   y=1;
else 
   y=(1-u);
end
