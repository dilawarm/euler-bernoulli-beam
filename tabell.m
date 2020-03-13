% Oppgave 5
function t = tabell()
    format longG;
    n_s = 10*2.^(1:11);

    L = 2;
    d = 0.03;
    w = 0.3;
    tetthet = 480;
    g = 9.81;
    E = 1.3e10;

    I = (w*d^3)/12;

    func = @(x) (-tetthet*w*d*g);
    y = @(x) (func(x)/(24*E*I))*(x^(2))*(x^2-4*L*x+6*L^2);

    feil = zeros(1, length(n_s));
    kond = zeros(1, length(n_s));
    riktig = y(L);

    index = 1;
    for n = n_s
        A = lagA(n);
        h = L/n;
        b = h^4 / (E*I) * arrayfun(func, h:h:L)';
        y = A\b;
        feil(index) = y(end) - riktig;
        kond(index) = condest(A);

        index = index + 1;
    end

    t = table(n_s', feil', kond');
    t.Properties.VariableNames = {'n' 'Feil' 'Kondisjonstall'};
end
