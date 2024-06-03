
load pe.am -ascii;


load SER_16QAM_HIP_TVC_1000Hz_WGL_vs_FFT.am -ascii;


load SER_16QAM_HIP_TVC_1000Hz_SGL_vs_FFT.am -ascii;

load SER_16QAM_HIP_WGL_vs_FFT_k1_32_k2_10.am




load SER_16QAM_HIP_SGL_vs_FFT_k1_32_k2_10.am -ascii;


index = 4:12;

N_FFT = 16:16:4096;
semilogy(log2(N_FFT),pe);
%semilogy(index,SER_16QAM_HIP_TVC_1000Hz_WGL_vs_FFT,'k*-');
hold on;
semilogy(index,SER_16QAM_HIP_WGL_vs_FFT_k1_32_k2_10,'bo');
%semilogy(index,SER_16QAM_HIP500Hz_WGL_FFT_Sim,'bo:');

semilogy(index,SER_16QAM_HIP_TVC_1000Hz_SGL_vs_FFT,'rv-');
semilogy(index,SER_16QAM_HIP_SGL_vs_FFT_k1_32_k2_10,'k+:');



xlabel('log_2(N_{FFT})','FontSize',12);
ylabel('SER','FontSize',12);
title('f_{D,max}=1000 Hz; 16-QAM','FontSize',12);



legend('Theoretical result, without guard interval','Simulation result, without guard interval','Theoretical result, with sufficient guard interval length','Simulation result, with sufficient guard interval length',4);


zoom on;
grid on;

hold off;
daten1 = [log2(N_FFT)', pe' ];
daten2 = [index', SER_16QAM_HIP_WGL_vs_FFT_k1_32_k2_10,SER_16QAM_HIP_TVC_1000Hz_SGL_vs_FFT', SER_16QAM_HIP_SGL_vs_FFT_k1_32_k2_10];  

save SER_16QAM_HIP1000Hz_WGL_FFT_Re.dat daten2 -ascii;
save SER_16QAM_HIP1000Hz_WGL_FFT_Re_Sub.dat daten1 -ascii;
