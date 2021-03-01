

function project ()
close all;
clear h;

graphics_toolkit qt;
h.ax = axes ("position", [0.05 0.42 0.5 0.5]);
h.fcn = @(x) polyval([-0.1 0.5 3 0], x);

h.plot_title_label = uicontrol ("style", "text",
                                "units", "normalized",
                                "fontsize", 14,
                                "string", "GENDER DETECTION",
                                "fontweight", 'bold',
                                "backgroundcolor", [0.699 0.898 0.996],
                                "horizontalalignment", "left",
                                "position", [0.6 0.85 0.35 0.08]);

h.plot_title_edit = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Gender",
                               "backgroundcolor", [0.49 0.73 0.83],
                               "fontweight", 'bold',
                               "callback",@gender_detect,
                               "position", [0.6 0.75 0.35 0.06]);
h.print_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Choose File",
                                "fontweight", 'bold',
                                "backgroundcolor", [0.49 0.73 0.83],
                               "callback",{@gender_detect,h.plot_title_edit},                            
                                "position", [0.6 0.45 0.35 0.09]);
h.print_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Play Audio",
                                "fontweight", 'bold',
                                "backgroundcolor", [0.49 0.73 0.83],
                               "callback",@playaudio,                            
                                "position", [0.6 0.20 0.35 0.09]);                               
                               

                                
 set (gcf, "color", [0.699 0.898 0.996])
guidata (gcf, h)

endfunction
