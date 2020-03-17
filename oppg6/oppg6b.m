function t = tabell6()
    n_s = 10*2.^(1:11);

    L = 2;
    d = 0.03;
    n = 10;
    p = 100;
    w = 0.3;
    tetthet = 480;
    g = 9.81;
    n = 10;    
    E = 1.3e10;

    I = (w*d^3)/12;

    func = @(x) ((-tetthet*w*d*g) -p*g*sin((pi/L)*x));
    y = @(x) func(0)/(24*E*I) * x^2 *(x^2 - 4*L*x + 6*L^2) - (g*p*L)/(E*I*pi) *((L^3/pi^3)*sin(pi*x/L) - x^3/6 + L*x^2/2 - L^2*x/pi^2);

    feil = zeros(1, length(n_s));
    kond = zeros(1, length(n_s));
    riktig = y(L);
    last = zeros(0, length(n_s));

    index = 1;
    for n = n_s
        A = lagA(n);
        h = L/n;
        b = h^4 / (E*I) * arrayfun(func, h:h:L)';
        y = A\b;
        feil(index) = abs(y(end) - riktig);
        kond(index) = condest(A);
        last(index) = y(end);
        index = index + 1;
    end
    t = table(n_s', feil', kond');
    t.Properties.VariableNames = {'n' 'Feil' 'Kondisjonstall'};
    
    zoom yon;
    plot(last);
    set(gca, "xTick", 1:11)
    set(gca, "xTickLabel", n_s)
    grid;
    hold on;
    plot(riktig.*ones(length(last), 1));
    hold off;
end
