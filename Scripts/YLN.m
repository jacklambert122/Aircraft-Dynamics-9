%% Author: Jack Lambert
% ASEN 3128
% HW 9
% Purpose: finds the changes in the
% y-component body force, roll moment, and yaw moment with changes in
% y-component of velocity, x-comp of angular velocity, and z-comp of 
% angular velocity 
% Date Modified: 4/15/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Delta_Y, Delta_L, Delta_N] = YLN(Y,L,N,Delta_v,Delta_p,Delta_r)

Delta_Y = Y(1)*Delta_v + Y(2)*Delta_p + Y(3)*Delta_r; %Change in Side Force (N)
Delta_L = L(1)*Delta_v + L(2)*Delta_p + L(3)*Delta_r; % Change in Roll Moment (m*N)
Delta_N = N(1)*Delta_v + N(2)*Delta_p + N(3)*Delta_r; % Change in Yaw Moemnt (m*N)

end