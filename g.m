function xplus = g(x)
%--------------------------------------------------------------------------
% Matlab M-file Project: HyEQ Toolbox @  Hybrid Systems Laboratory (HSL), 
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: g.m
%--------------------------------------------------------------------------
% Project: Simulation of the Heavy Ball method for finding the nearest
% non-unique minimum. This is non-hybrid, for now.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%   See also HYEQSOLVER, PLOTARC, PLOTARC3, PLOTFLOWS, PLOTHARC,
%   PLOTHARCCOLOR, PLOTHARCCOLOR3D, PLOTHYBRIDARC, PLOTJUMPS.
%   Copyright @ Hybrid Systems Laboratory (HSL),
%   Revision: 0.0.0.3 Date: 05/20/2015 3:42:00

global distance etaBar lambda_1 gamma_1

% state
z1 = x(1);
z2 = x(2);
p = x(3);

y1 = [z2 GradientL(z1)];

u = - lambda_1*y1(1) - gamma_1*y1(2); 

if ((u == 0) && p == 1) %y1(1) == 0 && y1(2) == 0
    % Choosing at random whether a will be negative or positive. 
    distance = 0;
    while distance == 0
        distance = randi([-1,1]);
    end
    z2_M = distance*etaBar;
    p_M = p;
else 
    z2_M = z2;
    p_M = 1-p;
end

xplus = [z1;z2_M;p_M]; 
end                            