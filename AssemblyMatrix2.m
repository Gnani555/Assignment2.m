% problem 2b: assembly, nodes with different dofs from different 
elements 
nelem=2; 
nnode=3; 
Kglobal=zeros(8 ,8); 
%for element 1 
K1=250000*[10 0 0 -10 0 0;0 0.835 5 0 -0.0835 5;0 5 400 0 -5 200;... -10 0 0 10 0 0;0 -0.0835 -5 0 0.0835 -5;0 5 200 0 -5 400]; 
dest1=[1 2 3 4 5 6]; 
%for element 1 
k=3.15e04; 
theta=pi/4; 
c=cos(theta);s=sin(theta); 
K2=k*[c*c c*s -c*c -c*s;c*s s*s -c*s -s*s;c*s s*s c*c c*s;-c*s -s*s c*s 
s*s]; 
dest2=[1  2 7 8]; 
for ii=1:nelem 
if ii == 1 
Klocal=K1; 
dest=dest1; 
end 
if ii == 2 
Klocal=K2; 
dest=dest2; 
end 
%Assemble Kglobal here 
c=dest; 
l=Klocal; 
Kglobal(c,c)=Kglobal(c,c)+l ; 
end 
