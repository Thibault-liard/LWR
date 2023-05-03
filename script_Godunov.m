%%Construction of (t,x)->u^n(t,x) an approximate solution of Burgers equation with initial data u_0.
close all
%%Parameter 
a=-10; b=10; T=10; %u^n(t,x) with  x\in [a,b] and t\in[0,T]. 
u_min=0; u_max=1;  % u_min \leq u_0 \leq u_min.
lambda_max=1;
N=200; %number of discretization points in space  (x_0=a, N-1 points,x_N=b)
M=floor((2*lambda_max*T*N)/(b-a))+1; 
Delta_x=(b-a)/N; %space step
Delta_t=T/M; %time step

%%Condition CFL: (2*Delta_t/(Delta_x))*max(u_min,u_max) <= 1/2
    if (2*Delta_t/(Delta_x))>1
        disp('CFL not verified')
    end 

%%Construction of an approximate function u_0^n of u_0
    % -M<=j<=-1 allows us to define the boundary condtion at x=a via the introducing of ghost cells 
    % N+1<=j<=N+M allows us to define the boundary condtion at x=b via the introducing of ghost cells 
    U_discr=zeros(M+1,N+1+2*M);
    X_discr=zeros(1,N+1+2*M);
    for j=1:N+1+2*M
        X_discr(j)=a+(-M+j-1)*Delta_x;
    end
   
    
    
i=0;
for j=-M:N+M
    i=i+1;
    U_discr(1,i)=(1/Delta_x)*integral(@(x)(u_1(x)),a+(j-1/2)*Delta_x,a+(j+1/2)*Delta_x);
end 
 %plot(X_discr,  U_discr(1,:)) 
 

%%Construction of an approximate function u^n+1 of u_0 via u^n

for n=0:M-1
    i=n+1;
for j=-M+n+1:N+M-n-1
    i=i+1;
    U_discr(n+2,i)= U_discr(n+1,i)-(Delta_t/Delta_x)*(g_God_LWR(U_discr(n+1,i),U_discr(n+1,i+1))-g_God_LWR(U_discr(n+1,i-1),U_discr(n+1,i)));
end 
end 
    

%%Extraction of u^n without the gost cells introduced to take into account
%%the boundary condition
Ufinal=zeros(M+1,N+1);
 Ufinal=U_discr(1:M+1,M+1:M+1+N);
 

%%Plotting of the solution u^n over [a,b] at time tn=n \Delta_t.

plot(a:0.01:b,U_f(0,a:0.01:b,a,N,Delta_x,Ufinal),'r')
hold on 
plot(a:0.01:b,U_f(M,a:0.01:b,a,N,Delta_x,Ufinal),'b--')
hold on
%plot(a:0.01:b,U_f(M,a:0.01:b,a,N,Delta_x,Ufinal),'b')

%%%%Animation
k=1;

for n=0:M
   
    ls=num2str(k);
    namefile=['GodunovSolT_',ls];
    k=k+1;
    XX=a:0.01:b;
   YY=U_f(n,a:0.01:b,a,N,Delta_x,Ufinal);
   GodunovSolT=[XX',YY'];
   %SolT=[[final_boundaries,final_boundaries(end)+1]',final_densities'];
   save(fullfile('Animations',namefile), 'GodunovSolT', '-ascii')
end  

function y=U_f(n,x,a,N,Delta_x,Ufinal) %plotting function
y=zeros(1,length(x));
for i=1:length(x)
for j=0:N
if (a+(j-1/2)*Delta_x<=x(i))&& (x(i)<a+(j+1/2)*Delta_x)
    y(i)=Ufinal(n+1,j+1);
end
end 
end
end 






    
    
        
        