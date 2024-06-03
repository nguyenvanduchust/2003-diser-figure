clear;

load P_ICI_SGL_fd1000Hz_vs_DFTLength.am -ascii;

P_ICI_SGL_x = P_ICI_SGL_fd1000Hz_vs_DFTLength(1,:);
P_ICI_SGL = P_ICI_SGL_fd1000Hz_vs_DFTLength(2,:);

load P_ISI_ICI2_vs_DFTLength.am -ascii;

P_ISI_ICI2 = P_ISI_ICI2_vs_DFTLength(2,:);

load Interfer_power_WGL_fd1000Hz_vs_DFTLength.am -ascii;
Interfer_power_WGL_fd1000Hz = Interfer_power_WGL_fd1000Hz_vs_DFTLength(2,:);

P_Sum = P_ICI_SGL + P_ISI_ICI2;
index = P_ICI_SGL_x;

M = 2^9;
N = 2^(10);
index_zoom = M:16:N;

%plot(log2(index_zoom), 10*log10(P_ICI_SGL(M/16:N/16)),'r-');
%hold on;
%plot(log2(index_zoom), 10*log10(P_ISI_ICI2(2^9/16:2^10/16)),'b-');
plot(log2(index_zoom), 10*log10(Interfer_power_WGL_fd1000Hz(M/16:N/16)),'k-');

hold on;
plot(log2(index_zoom), 10*log10(P_Sum(M/16:N/16)),'r-');

%ylabel('Interference power in dB','FontSize',12);
%xlabel('log_2(N_{FFT})','FontSize',12);
%legend('1) TVC with f_{D,max}=1000, SGL','2) TIC, with without guard interval', '3) sum of (1) and (2)', '4) TVC with f_{D,max}=1000, with without guard interval',0);



hold off;


%axis([9 10 -20.6 -19.2]);

daten = [log2(index_zoom)', 10*log10(Interfer_power_WGL_fd1000Hz(M/16:N/16))', 10*log10(P_Sum(M/16:N/16))'];

save C2F7_ApproximationOfPI_Zoom.dat daten -ascii;
