fm=16000;
s=audiorecorder(fm,16,1);
recordblocking(s,8);
audio_grabado=getaudiodata(s, 'double');  
[pitch_bueno,pitch_grabado,pitch_grabado2] = autocor_pitch('audios\octava4_piano.wav',audio_grabado);

% [pitch_bueno,pitch_grabado] = autocor_pitch('audios\octava3_tiempo_piano.wav','audios\octava3_tiempo_voz.wav'); 

%PITCH PESADO
pitch_grabado_correcto = pitch_pesado(pitch_grabado);

%PUNTAJE
% error = puntaje(pitch_bueno,pitch_grabado_correcto);
error = puntaje_aux(pitch_bueno,pitch_grabado_correcto);
disp('Tu puntaje es:')
disp(mean2(error));

%PLOT
figure;
do=261; re=293; mi=329; fa=349; sol=392; la=440; si=494; % Octava3

do = do/2;
re = re/2;
mi = mi/2;
fa = fa/2;
sol = sol/2;
la = la/2;
si = si/2;

%hold on;
j = 3;
subplot(j,1,1), 
%figure(1);
plot(pitch_grabado2,'rx'),title('Autocorrelacion');
subplot(j,1,2),
%plot(pitch_bueno,'bo'), title 'Octava 3'
%figure(2);
plot(pitch_grabado,'rx'),title('Autocorrelacion con clipping');
subplot(j,1,3),
%figure(3);
plot(pitch_grabado_correcto1,'rx'),title('Autocorrelacion con clipping y pesos');

% plot([0,length(pitch_bueno)],[do,do]);
% plot([0,length(pitch_bueno)],[re,re]);
% plot([0,length(pitch_bueno)],[mi,mi]);
% plot([0,length(pitch_bueno)],[fa,fa]);
% plot([0,length(pitch_bueno)],[sol,sol]);
% plot([0,length(pitch_bueno)],[la,la]);
% plot([0,length(pitch_bueno)],[si,si]);
% legend('BASE','PITCH','DO','RE','MI','FA','SOL','LA','SI');


