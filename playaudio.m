

function playaudio ()
  pkg load signal;
 file = uigetfile ("*.wav");
[y, fs]=audioread(file);
sound(y,fs);

endfunction
