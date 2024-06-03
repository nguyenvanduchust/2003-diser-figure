%****************************************************************************
% Chapter 2, Figure 3
%****************************************************************************-

clear;


load PI_calculation.am -ascii;

load P_ICI2_Calculation.am -ascii; 
load P_ISI_Calculation.am -ascii; 



G = 0:7;



plot(G,real(10*log10(PI_calculation(1:8))),'ro-');
hold on;
plot(G,real(10*log10(P_ICI2_Calculation(1:8))),'b+');

plot(G,real(10*log10(P_ISI_Calculation(1:8))),'kx');

hold off;

zoom on;
grid on;

ylabel('Interference power in dB','FontSize',12);
xlabel('Guard interval length in samples','FontSize',12);
legend('Total interference power ','ICI-CIG power','ISI power');

axis([ -0.1 7.1 -50 -10]);

daten = [G', real(10*log10(PI_calculation(1:8)))', real(10*log10(P_ICI2_Calculation(1:8)))', real(10*log10(P_ISI_Calculation(1:8)))'];

save C2F3_ComofP_ICIwICI_CIG.dat daten -ascii;


