%****************************************************************************
 
%****************************************************************************-

clear;


load PI_Ray_Amp_100Experiments.am -ascii; % MATLAB result, simulated for static and uncorelated scatering channel, 100 experiments

load PI_Ray_Amp_10Experiments.am -ascii; %10 experiments
load PI_Ray_Amp_1Experiments.am -ascii; %1 experiments

load PI_calculation.am -ascii;

G = 0:7;
figure(1);
plot(G,real(10*log10(PI_calculation(1:8))),'ro-');
hold on;
plot(G,real(10*log10(PI_Ray_Amp_100Experiments(1:8))),'b*');

plot(G,real(10*log10(PI_Ray_Amp_10Experiments(1:8))),'kx-.');
plot(G,real(10*log10(PI_Ray_Amp_1Experiments(1:8))),'k+-.');
hold off;

zoom on;
grid on;

ylabel('Interference power in dB','FontSize',12);
xlabel('Guard interval length in samples','FontSize',12);
legend('Calculation results', 'Simulation results with 100 experiments', 'Simulation results with 10 experiments', 'Simulation results with 1 experiment',0);

daten = [G', real(10*log10(PI_calculation(1:8)))', real(10*log10(PI_Ray_Amp_1Experiments(1:8)))', real(10*log10(PI_Ray_Amp_10Experiments(1:8)))', real(10*log10(PI_Ray_Amp_100Experiments(1:8)))'];

save C2F2_CalculationVerify.dat daten -ascii;





