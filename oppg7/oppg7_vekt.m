function res = oppg7_vekt(pos)
    res = 0; % i utgangspunktet ikke noe ekstra vekt p� brettet
    if (pos >= 1.7) % kun siste 30cm har vekten av stuperen p� seg
        res = -9.81*50/0.3;
    end
end