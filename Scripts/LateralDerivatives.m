%% Author: Jack Lambert
% ASEN 3128
% Homework 9
% Purpose: Find the dimensional derivatives given the none dimensional
% derivatives from pg.187 of Etkin for the the flight conditions of a
% Boeing 747, given on pg. 165 of Etkin. Also finds the changes in the
% y-component bofy force, roll moment, and yaw moment with changes in
% y-component of velocity, x-comp of angular velocity, and z-comp of 
% angular velocity 
% Date Modified: 4/15/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Airplane Parameters
% Nondimensional Lateral Derivatives
% Table 6.6 -
Cy = [-.8771, 0, 0];
Cl = [-.2797, -.3295, .304];
Cn = [.1946, -.04073, -.2737];

% Flight conditons for Boeing 747 (from Etkin pg. 165)
Alt = 40000*(0.3048); % Altitude [ft] -> [m]
rho = 0.3045; % Density [kg/m^3]
W = 2.83176*10^6; % Weight [N]
Ix = 0.247*10^8; % Moment of Interia x-SA [kg m^2]
Iy = 0.449*10^8; % Moment of Interia y-SA [kg m^2]
Iz = 0.673*10^8; % Moment of Interia z-SA [kg m^2]
Izx = -.212*10^7; % Moment of Interia zx-SA [kg m^2]
CD = .043; % Coefficient of Drag
cbar = 8.324; % Mean Chord Length [m]
S = 511; % Surface Area [m^2]
b = 59.64; % Span [m]
g = 9.81; % Gravity Constant [m/s^2]
m = W/g; % Mass of Plane [kg]
Vel = 235.9;% Velocity [m/s]
u0 = Vel; % Initial Velocity in x-coord - Stability Axis Frame (Trim State)


%% State Variable Derivatives
% Y (N)
Yv = (1/2)*rho*u0*S*Cy(1);
Yp = (1/4)*rho*u0*b*S*Cy(2);
Yr = (1/4)*rho*u0*b*S*Cy(3);

Y = [Yv, Yp, Yr]';

% L (N*m)
Lv = (1/2)*rho*u0*b*S*Cl(1);
Lp = (1/4)*rho*u0*b^2*S*Cl(2);
Lr = (1/4)*rho*u0*b^2*S*Cl(3);

L = [Lv, Lp, Lr]';

% N (N*m)
Nv = (1/2)*rho*u0*b*S*Cn(1);
Np = (1/4)*rho*u0*b^2*S*Cn(2);
Nr = (1/4)*rho*u0*b^2*S*Cn(3);

N = [Nv, Np, Nr]';

T = table(Y,L,N);
T.Properties.VariableNames = {'Y' 'L' 'N'};

%% Changes in side force, roll moment, and yaw moment
% Function is defined :  
% [Delta_Y, Delta_L, Delta_N] = YLN(Y,L,N,Delta_v,Delta_p,Delta_r)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Y: y-component of body force (N)
%            L: Roll  Moment (N*m)  
%            N: Yaw Moment (N*m)
%            Delta_v: Change in y-component of velocity (m/s)
%            Delta_p: Change in x-comp of angular velocity (rad/s)
%            Delta_r: Change in z-comp of angular velocity (rad/s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% i.) 
[~, Delta_L_1, ~] = YLN(Y,L,N,0,0.05,0);
% ii.)
[~, ~, Delta_N_2] = YLN(Y,L,N,0,0,-0.05);
% iii.)
[~, Delta_L_3, ~] = YLN(Y,L,N,0,0,0.01);
% iv.)
[~, ~, Delta_N_4] = YLN(Y,L,N,0,-0.7,0);
% v.)
[Delta_Y, ~, ~] = YLN(Y,L,N,2.04,0.15,0);
% vi.)
[~, ~, Delta_N_6] = YLN(Y,L,N,-1.3,0.5,0.37);


check = 1;
