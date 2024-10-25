% Parameters
g=9.81;% acceleration due to gravity (m/s^2)
y0=0;% initial y position (m)
x0=0;% initial x position (m)
t=0:0.1:12;% total time of flight
th=pi/3; % launch angle (rad)

v=70; % initial velocity (m/s)
vx0=v*cos(th); 
vx=vx0;
vy0=v*sin(th); %m/s

x=x0+vx*t;% x position
y=y0+vy0*t-0.5*g*t.^2;% y position

% Setting up the Plot
figure; hold on
title(sprintf('Trajectory\nTime: %0.2f sec', t(1)), 'Interpreter', 'Latex');
xlabel('x', 'Interpreter', 'Latex')
ylabel('y', 'Interpreter', 'Latex')

grid minor  % Adding grid lines
axis equal  % Equal axis aspect ratio

% Create file name variable
filename = 'animation2.gif';
% Plotting with no color to set axis limits
plot(x,y,'Color','none');
% Plotting the first iteration
p = plot(x(1),y(1),'b');
m = scatter(x(1),y(1),'filled','b');
% Iterating through the length of the time array
for k = 1:length(t)
    % Updating the line
    p.XData = x(1:k);
    p.YData = y(1:k);
   
    % Updating the point
    m.XData = x(k); 
    m.YData = y(k);

     % Updating the title
    title(sprintf('Trajectory\nTime: %0.2f sec', t(k)),...
    'Interpreter','Latex');
    % Delay
    pause(0.01)
    % Saving the figure
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if k == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,...
        'DelayTime',0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append',...
        'DelayTime',0.1);
    end
end