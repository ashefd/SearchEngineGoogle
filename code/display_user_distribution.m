
function display_user_distribution(order, P, n, M)

    f = figure(2);  
        
    clf;
    
    xlim([0 50])
    ylim([0 50])

    P = randi([1 100],n,1,'double');
    disp(P);
    r = 1;
    x = randi([10 40],n,1,'double');
    y = randi([10 40],n,1,'double');
    c = rand(n,1);
    animationWriter = VideoWriter('animation_file');
    open(animationWriter);
    
    
    for numberOfFrames=1:100
      % create data for circle plot or any other processing you want to do
        clf;
        for i = 1 : n
            r = 1 + P(i) / 50;
            plotcircle(r, x(i), y(i), order(i),c(i));
        end
        
        P = M * P;
        
        frame = getframe(gcf);
        writeVideo(animationWriter, frame);
    end
    close(animationWriter);
%{    
%display web user distribution
%# some graph in 2D
[adj,XY] = bucky;
N = 30;
adj = adj(1:N,1:N);
XY = XY(1:N,1:2);

%# plot edges
[xx yy] = gplot(adj, XY);
hFig = figure(); axis equal
line(xx, yy, 'LineStyle','-', 'Color','b', 'Marker','s', 'MarkerFaceColor','g')

%# draw text near vertices
xoff = 0; yoff = 0;     %# optional offsets
str = strtrim(cellstr(num2str((1:N)')));
hTxt = text(XY(:,1)+xoff, XY(:,2)+yoff, str, ...
    'FontSize',12, 'FontWeight','bold', ...
    'HorizontalAlign','right', 'VerticalAlign','bottom');

%# draw circles around text
e = cell2mat(get(hTxt, {'Extent'}));
p = e(:,1:2) + e(:,3:4)./2;
hLine = line('XData',p(:,1), 'YData',p(:,2), ...
    'LineStyle','none', 'Marker','o', 'MarkerSize',18, ...
    'MarkerFaceColor','none', 'MarkerEdgeColor','k');

%# link circles position to text (on zoom and figure resize)
callbackFcn = @(o,e) set(hLine, ...
    'XData',cellfun(@(x)x(1)+x(3)/2,get(hTxt,{'Extent'})), ...
    'YData',cellfun(@(x)x(2)+x(4)/2,get(hTxt,{'Extent'})) );
set(zoom(hFig), 'ActionPostCallback',callbackFcn)
set(hFig, 'ResizeFcn',callbackFcn)

%}

end

function plotcircle(r,x,y,name,c)
    th = 0:pi/100:2*pi;
    f = r * exp(j*th) + x+j*y;
    hold on;
    patch(real(f), imag(f), c);
    text(x, y, name, 'HorizontalAlignment', 'center');
end