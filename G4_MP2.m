clc; clear; close all;

disp('This script solves the differential equation dy/dx + (1/x)y = x,  x > 0');

% Input Validation for Numerical Method Choice
choice = 0;

while choice ~= 1 && choice ~= 2 
    disp(' ');
    disp('Choose Numerical Method to be used:');  
    disp('  1) Euler''s Method');
    disp('  2) Runge–Kutta (Order 4)');
    choice = input('What is your choice? ', 's');

    choice = str2double(choice);

    if isnan(choice)
        disp('Invalid input. Please enter a numeric value.');
        choice = 0;
    
    elseif choice ~= 1 && choice ~= 2 
        disp('Invalid choice. Please enter 1 or 2.');
    end
end

disp(' ');

if choice == 1
        disp('You have chosen Euler''s Method!');
else 
        disp('You have chosen Runge–Kutta (Order 4)!');
end

% Define RHS f(x,y) and later exact solution from IC
f = @(x,y) x - (1./x).*y;   % domain x>0

% Inputs and Input/Domain Validation (singularity at x=0)
% Lower limit for x range
x0 = 0;

while ~(isscalar(x0) && isfinite(x0) && x0>0)
    disp (' ');
    x0 = input('Enter the LOWER limit for x range (>0): ', 's');

    x0 = str2double(x0);

    if isnan(x0)
        disp('Invalid input. Please enter a numeric value.');
        x0 = 0;
    
    elseif ~(isscalar(x0) && isfinite(x0) && x0>0)
        disp('Invalid, x0 must be finite and > 0.');
    end

end

% Upper limit for x range
xf = x0; % xf can't equal x0

while ~(isscalar(xf) && isfinite(xf) && xf>x0)
    disp (' ');
    xf = input('Enter the UPPER limit for x range (> lower): ', 's');
    xf = str2double(xf);

    if isnan(xf)
        disp('Invalid input. Please enter a numeric value.');
        xf = x0;
    
    elseif ~(isscalar(xf) && isfinite(xf) && xf>x0)
        disp('Invalid, xf must be finite and > x0.');
    end

end

% y value at given x value
y0 = 1/0; 

while ~(isscalar(y0) && isfinite(y0))
    disp (' ');
    y0 = input(['Enter the value for y at x = ' num2str(x0) ': '], 's');
    y0 = str2double(y0);

    if isnan(y0)
        disp('Invalid input. Please enter a numeric value.');
        y0 = 1/0;
    
    elseif ~(isscalar(y0) && isfinite(y0))
        disp('Invalid, y0 must be finite.');
    end

end

% Step size
h = 0; 

while ~(isscalar(h) && isfinite(h) && h>0)
    disp (' ');
    h  = input('Enter the interval or step size (>0): ', 's');
    h = str2double(h);

    if isnan(h)
        disp('Invalid input. Please enter a numeric value.');
        h = 0;
    
    elseif ~(isscalar(h) && isfinite(h) && h>0)
        disp('Invalid, h must be finite and > 0.');
    end

end

% Generate range
x = x0:h:xf;
if abs(x(end)-xf) > 1e-12 % Possible floating-point errors are taken into account
    fprintf('Note: (xf - x0) is not a multiple of h. Using x_end_adj = %.12g.\n', x(end));
end
if any(abs(x) < eps) % Precision limits for floating-point numbers in computers are accounted for
    error('Grid hits x=0; choose x0>0 and steps that avoid 0.');
end

n = numel(x);
y = zeros(1,n); y(1) = y0;

% Numerical solution
if choice == 1
    % Euler
    method = 'y_Euler';
    for i = 1:n-1
        y(i+1) = y(i) + h * f(x(i), y(i));
    end
else
    % RK4
    method = 'y_RK4';
    for i = 1:n-1
        k1 = f(x(i), y(i));
        k2 = f(x(i) + h/2, y(i) + (h/2)*k1);
        k3 = f(x(i) + h/2, y(i) + (h/2)*k2);
        k4 = f(x(i) + h,   y(i) + h*k3);
        y(i+1) = y(i) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
end

% Exact solution that matches the entered IC
C = x0*(y0 - x0^2/3);
y_true = @(x_) x_.^2/3 + C./x_;
y_exact = y_true(x);

% Percent relative error
err = 100*abs((y_exact - y)./y_exact);
err(~isfinite(err)) = NaN;

% Table of Values

data = [x; y_exact; y; err]; % Combine data into one matrix

disp(' ');
fprintf('Tabulated solution:\n\n');

% Headers
fprintf('%5s%15s%15s%15s\n', 'x', 'y_true', method, '|εₓ| (%)');

% Line
fprintf('%5s%15s%15s%15s\n',repmat('-', 1, 5), repmat('-', 1, 15), repmat('-', 1, 15), repmat('-', 1, 15));

% Values
fprintf('%5.2f%15.5f%15.5f%15.2f\n', data);


% Plotting of Graph

disp(' ');

figure;
hold on;
set(gca, 'Color', [0.65 0.65 0.65 ]); % background color for graphing area

plot(x, y_exact, 'b', 'LineWidth', 5); 
plot(x, y, 'y--o', 'MarkerFaceColor', 'y', 'LineWidth', 3);
legend('True Solution', 'Numerical Solution'); 
grid on;

hold off; 

xlabel('x');
ylabel('y');
title('Graph');