a)
---

$$
\begin{aligned}
y(x) &= (\frac{f}{24EI})x²(x²-4Lx+6L²)\\
y'(x) &=\frac{fx(x²-3Lx+ 3L²)}{6EI}\\
y''(x) &= \frac{f(x-L)^2}{2EI}\\
y'''(x) &= \frac{f(x-L)}{EI}\\
y''''(x) &= \frac{f}{EI}\\
\end{aligned}
$$

Setter inn $y''''$ i euler ligningen:

$$
\begin{aligned}
EIy'''' &= f(x)\\
\frac{fEI}{IE} &= f(x)\\
\Rightarrow\underline{\underline{f = f(x)}}
\end{aligned}
$$

b)
---
Skal vise at $ y^{(6)}(c) = 0:$

Vet at $y''''(x) =\frac{f}{EI}$ fra forrige deloppgave, regner derfor ut $y^{(5)}$ og $y^{(6)}$

$$
\begin{aligned}
y^{(5)} (x) &= 0 \\
\Rightarrow y^{(6)}(x) &= 0
\end{aligned}
$$

Dette gjør at $\frac{y^{(6)}(c)}{6!}h^6 = 0 $ som gjør at den 4-deriverte $\frac{1}{h^4}Ay$ er eksakt

c)
---
Skal regne ut vektoren $y_e = [y(0.2), y(0.4), y(0.6)...y(2.0)]^T$ for den eksakte løsningen 
$$y(x) = (\frac{f}{24EI})x²(x²-4Lx+6L²)$$ 

Trenger da konstantene f, E, I og L, hentet fra boka Numerical Analysis av Timothy Sauer

regner ut f ved hjelp av tykkelsen $w$ og bredden $d$ som er oppgitt i boka:
$$
\begin{aligned}
w &= 0.3m\\
d &= 0.03m\\
f &= -480wdg = -480 \cdot 0.3\cdot 0.03\cdot 9.81 = -42.3792
\end{aligned}
$$

regner ut $I$ ved hjelp av $w$ og $d$ som er oppgitt i boka:
$$
\begin{aligned}
I = \frac{wd^3}{12} &= \frac{0.3\cdot(0.03)^3}{12} = 6.75\cdot10^{-7} \\
\\
E&=1.3\cdot10^{10} \frac{N}{m^2}\\
L&= 2m
\end{aligned}
$$

regner ut $y_e$ med python og får :

$$
\begin{aligned}
\begin{bmatrix}
-0.0001806247384615385\\
-0.0006748475076923078\\
-0.0014169865846153848\\
-0.002349087507692308\\
-0.0034209230769230766\\
-0.004589993353846155\\
-0.005821525661538462\\
-0.007088474584615385\\
-0.00837152196923077\\
-0.009659076923076923\\
\end{bmatrix}
\end{aligned}
$$

Regner så ut den numeriske fjerdederiverte av $y(x)$ ved hjelp av den numeriske fjerdederiverte $\frac{1}{h^4}Ay$

Lager matrisen $A$ ved hjelp av lagA() fra oppgave 2:

$$
\begin{aligned}
A=\begin{bmatrix}
16&-9&\frac{8}{3}&-\frac{1}{4}&0&0&0&0&0&0\\
-4&6&-4&1&0&0&0&0&0&0\\
1&-4&6&-4&1&0&0&0&0&0\\
0&1&-4&6&-4&1&0&0&0&0\\
0&0&1&-4&6&-4&1&0&0&0\\
0&0&0&1&-4&6&-4&1&0&0\\
0&0&0&0&1&-4&6&-4&1&0\\
0&0&0&0&0&1&-4&6&-4&1\\
0&0&0&0&0&0&\frac{16}{17}&\frac{-60}{17}&\frac{72}{17}&\frac{-28}{17}\\
0&0&0&0&0&0&\frac{-12}{17}&\frac{96}{17}&\frac{-156}{17}&\frac{72}{17}  \\
\end{bmatrix}
\end{aligned}
$$

Da blir $\frac{1}{h^4}Ay = \frac{1}{0.2^4}Ay:$

$$
\begin{bmatrix}
-0.004829538461538441\\
-0.004829538461538441\\
-0.0048295384615375525\\
-0.004829538461541549\\
-0.004829538461531779\\
-0.004829538461542882\\
-0.004829538461534888\\
-0.004829538461535776\\
-0.004829538461541105\\
-0.0048295384615322234
\end{bmatrix}
$$
Regnet ut i python, vedlegg 4.py

d)
---
Skal sammenligne den numeriske fjerdederiverte vi fant i oppgave c) med vektoren $\frac{f}{EI}\begin{bmatrix}1&1&1&...&1\end{bmatrix}^T$
og skal finne foroverfeil og relativ foroverfeil til den numeriske fjerdederiverte $\frac{1}{h^4}Ay_e$
Antar at relativ bakoverfeil er $e$

Regner først ut $\frac{f}{EI}\begin{bmatrix}1&1&1&...&1\end{bmatrix}^T$ og bruker konstantene fra de tidligere oppgavene:

$$
\begin{aligned}
\frac{-42.3792}{1.3\cdot10^{10}\cdot6.75\cdot10^{-7}}\cdot[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]^T =\begin{bmatrix}
-0.0048295384615384615\\
-0.0048295384615384615\\
-0.0048295384615384615\\
-0.0048295384615384615\\
-0.0048295384615384615\\
-0.0048295384615384615\\
-0.0048295384615384615\\
-0.0048295384615384615\\
-0.0048295384615384615\\
-0.0048295384615384615\\
\end{bmatrix}
\end{aligned}
$$

Ser at vektoren er meget lik numerisk fjerdederivert $\frac{1}{h^4}Ay_e$
Finner nå foroverfeil med formel: 
$$
||x-x_0||_\infty
$$
Trenger da kun å finne den største differansen for hvert ledd i de to vektorene. Regner det ut med python (vedlegg 4.py) og differansen på vektorene blir da slik:

$$
\begin{bmatrix}
2.0816681711721685e-17\\
2.0816681711721685e-17\\
9.08995101411847e-16\\
3.0878077872387166e-15\\
6.682154829462661e-15\\
4.4200754167889045e-15\\
3.573530360512223e-15\\
2.6853519408120974e-15\\
2.643718577388654e-15\\
6.238065619612598e-15
\end{bmatrix}
$$

ser at største differanse er $\underline{\underline{6.682154829462661\cdot 10^{-15}}}$

Relativ foroverfeil beregnes med formel: 

$$
\frac{||x-x_0||_\infty}{||x||_\infty}
$$

Relativ foroverfeil blir da:

$$
\frac{6.682154829462661\cdot 10^{-15}}{0.0048295384615384615} = \underline{\underline{1.383601121034254\cdot10^{-12}}}
$$

Feilforstørring:
relativ bakoverfeil er gitt i oppgaven til $2^{-52}$


$$
Feilforstørring = \frac{relativ\space foroverfeil}{relatv\space bakoverfeil} = \frac{1.383601121034254\cdot10^{-12}}{2^{-52}} = \underline{\underline{6231.1854931192665}}
$$

Tallet beskriver forholdet mellom relativ bakoverfeil og relativ foroverfeil

Feilforstøttingen skal sammenlignes med kondisjonstallet til A. Må da først finne kondisjonstallet. Bruker lagA fra oppgave 2 og cond(A) i matlab og får svaret:

$$
cond(A) = 33254
$$

Kondisjonstallet forteller hva som er maksimalt mulig feilforstørringsfaktor. Feilforstørringsfaktoren vår er 6231 og er betydelig mindre enn 33254. dette betyr at resultatet vi har fått er en god tilnærming.
