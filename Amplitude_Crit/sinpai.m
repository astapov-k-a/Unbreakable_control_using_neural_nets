function re=sinpai(nticks)
ticklen=(2*pi)/(double(nticks)-1);
x=sin(-1/2*pi:ticklen:1.5*pi).*0.5+1;
re=sin(x);