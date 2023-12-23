temperature = [-196 -140 -120 -120 -120 -100 -100 -100 -78 -78 -78 -40 -40 -40 25 100];
energy = [10 12 33 19 18 26 41 30 86 105 129 210 243 220 245 246];
a = 12.85;
b = 244.7;
c = -70.79;
d = 13.26;
syms x
equation = a+(b-a)./(1 + exp((c-x)./d)) == 27;
root=solve(equation, x, 'Real', true);
double(root)
disp(root)
hold on;
syms x
equation = a+(b-a)./(1 + exp((c-x)./d)) == 128.775;
root=solve(equation, x, 'Real', true);
double(root)
disp(root)
hold on;
FCCtemp = [-40 -40 -40 25 100];
FCCenergy = [210 243 220 245 246];
createFits1(temperature, energy, FCCtemp, FCCenergy)