function y = oppgave3()
    n = 10;
    A = lagA(n);

    L = 2;
    d = 0.03;
    w = 0.3;
    tetthet = 480;
    g = 9.81;
    E = 1.3e10;

    h = L/n;
    I = (w*d^3)/12;

    func = @(x) (-tetthet*w*d*g);
    b = h^4 / (E*I) * arrayfun(func, h:h:L)';

    y = A\b;

    plot(0:h:L, [0 y']); axis equal;
end