function res = oppg7_vekt(pos)
    res = 0; % i utgangspunktet ikke noe ekstra vekt på brettet
    if (pos >= 1.7) % kun siste 30cm har vekten av stuperen på seg
        res = -9.81*50/0.3;
    end
end