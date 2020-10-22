
% maximum absorbed power for a pitching device in a single frequency 
% ("regular") wave is Pmax = J lambda / pi, where J is the wave power flux 
% (units power/length), and lambda is the wave length.

wkdir = WecOptTool.AutoFolder();

% Make a regular wave on the edge of validity
w = (0.1:0.1:3)';
SS = WecOptTool.SeaState.regularWave(w, [0.2, 10]);
w = SS.getRegularFrequencies(0.3);

% Half mesh simulation (long axis along x)
width = 2;
length = 10;
height = 5;

[hydro, meshes] = designDevice('parametric',    ...
                               wkdir.path,      ...
                               length,          ...
                               width,           ...
                               height,          ...
                               w);

[performance, model] = simulateDevice(length, height, hydro, SS, 'CC');
performance.summary()
