%% Function display_user_distribution
% order : order of the web site we want to evaluate
% P : population vector
% n : number of web site
% M : Google matrix
function display_user_distribution(TotalFrame, order, P, n, M, ax1, ax2)
    
    %f = figure;
    %g = figure;
    
    
    % Mis en place de la position de la population dans chaque site
    angles = linspace(0, 2*pi, 360); % 360 is the total number of points
    radius = 80; % rayon du grand cercle
    xCenter = 110;
    yCenter = 110;
    x = radius * cos(angles) + xCenter; 
    y = radius * sin(angles) + yCenter;
    c = rand(n, 3);
    
    totalEvolution = zeros(n,1);
    
    %  Mis en place d'une animation
    animationWriter = VideoWriter('animation_file');
    open(animationWriter);

    for numberOfFrames=1:TotalFrame
        totalEvolution(:,numberOfFrames) = P;

        %set(0, 'CurrentFigure', g)
        cla(ax1);
        cla(ax2);
        % Make the figure static
        axis equal;
        axis manual;
        %axis([0 250 -20 numberOfFrames]);
        xAxis = linspace(0, TotalFrame, numberOfFrames );
        axes('ColorOrder',c,'NextPlot','replacechildren') 
        %g.Position = [1000 500 500 500];
        
        plot(ax2, xAxis, totalEvolution');
        
        
        %set(0, 'CurrentFigure', f)
        %clf;
        %f.Position = [500 500 500 500];
        % Make the figure static
        %axis equal;
        %axis manual;
        %axis([-20 250 -20 250]);
        
        % Choose web site circle position
        indexes = zeros(1,n); % position index
        for i = 1 : n
            indexes(i) = length(angles) * i / n; %Array of index in circle
        end
        
        xPos = x(indexes);  % x position value for a web site
        yPos = y(indexes);  % y position value for a web site
        r = P * 2 / n; % radius of the web site circle (according to population)
        
        for i = 1:n
            for j = i:n
                line(ax1, [xPos(i) xPos(j)], [yPos(i) yPos(j)],'color','c','LineWidth',1) % Red line from (0,9) to (10,9)
            end
        end
        
        % Plot for each web site its circle
        for j = 1:n
            plotcircle(ax1, r(j),xPos(j),yPos(j),order(j),c(j, :)); % plot the circle
        end
        
        P = M * P; % change the value of P
        
        frame = getframe(gcf);
        writeVideo(animationWriter, frame);
        
    end
    close(animationWriter);
    
end




%% Function plotcircle
% draw a circle given by x et y its center and r its radius
% r : radius
% x : x position of the center of the circle
% y : y position of the center of the circle
% name : name associated
% c : color of the circle (decimal number)
function plotcircle(ax1, r,x,y,name,c)
    th = 0:pi/100:2*pi;
    f = r * exp(1i*th) + x+1i*y;
    %hold on;
    patch(ax1, real(f), imag(f), c);
    text(ax1, x, y, name, 'HorizontalAlignment', 'center');
end