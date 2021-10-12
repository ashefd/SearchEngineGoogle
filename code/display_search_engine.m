% function that set up the front-end

function display_search_engine()
    clf;
    t = annotation('textbox');
    sz = t.FontSize;
    t.FontSize = 12;
    t.String = 'Write down anything';



    f=figure;

    img = imread('../images/google.jpg');
    image(img);
    handles.f=figure;
    handles.t= uicontrol(f,'Style','edit','String','','Position',[100 365 100 40]);
    handles.b1 = uicontrol(f,'Style','pushbutton','String','RECHERCHER','Position',[100 100 100 40]);
    set(handles.b1, 'Callback', {@b1_Callback, handles});


end


function b1_Callback(source, eventdata, handles)
 x=get(handles.t,'string');
  if(isempty(x))
     msgbox('enter the text');
 else
     msgbox('ds');
  end
end