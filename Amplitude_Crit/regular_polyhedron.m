function re=regular_polyhedron(n,x,y,r,phi0)

i=0:n-1;
re(:,2)=y+r*sin(phi0+2*pi*i/n);
re(:,1)=x+r*cos(phi0+2*pi*i/n);