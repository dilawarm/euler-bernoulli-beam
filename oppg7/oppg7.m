oppg7func();
function res = oppg7func()
    n = 1280; % verdien som viste seg � gi best tiln�rming i oppg6
    
    L = 2; % lengde p� stupebrett i meter
    d = 0.03; % tykkelse p� stupebrettet 
    w = 0.3; % bredden p� stupebrettet
    
    tetthet = 480; %kg/m^3
    g = 9.81; % tyngdefeltstyrken p� jorda
    E = 1.3e10; % materialkonstanten (youngmodulusen)
    I = (w*d^3)/12; % arealmoment
    
    func = @(x) ((-tetthet*w*d*g) + oppg7_vekt(x));
    
    A = lagA(n);
    h = L/n;
    b = h^4 / (E*I) * arrayfun(func, h:h:L)';
    y = A\b;
    res = y(end);
    disp(res)
    
    axis([0 2 -1 0])
    
    plot(h:h:L, y)
    ylim([-0.5 0.5])
end