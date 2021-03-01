
function gen=gender_detect (hObject, eventdata)
 pkg load signal;
 file = uigetfile ("*.wav");
[y, fs]=audioread(file);
time = length(y)/fs;

 ms20 = fs/50;
 t = (0:length(y)-1)/fs;

    #calculate autocorrelation
    r = xcorr(y,ms20,'coeff');
    #plot autocorrelation
    d = (-ms20:ms20)/fs;
    plot(d, r);
    title('Autocorrelation');
    xlabel('Delay (s)');
    ylabel('Correlation coeff.');
    ms2 = fs/500; #maximum speech Fx at 500Hz
    ms20 = fs/50; #minimum speech Fx at 50Hz
    #just look at region corresponding to positive delays
    r = r(ms20 + 1 : 2*ms20+1);
    [rmax, tx] = max(r(ms2:ms20));
    Fx = fs/(ms2+tx-1);       #Finding the fundamental freq.
    
    if Fx >=80 && Fx <=175
        gen='Male';
        #msgbox('Male');
    elseif Fx>175 && Fx<=255
        gen='Female';
        #msgbox('Female');
    else
        gen='Couldnt Recognize';
    end
    h = guidata(hObject);
    set(h.plot_title_edit, 'String', gen)

endfunction
