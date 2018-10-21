%% --------------------------------------------------------------------
%% Figure with all data

clear
load("variables");
% Main variables: 
% Vt_avg_T
% Vt_sd_T
% It_avg_T
% It_sd_T

sample_names = {'PVA';...
    'PVA-2 G90';...
    'PVA-2 G300';...
    'PVA-7 G90';...
    'PVA-10 G90';...
    'PVA-5 G300';...
    'PVA-5 G90 1.3 NaCl';...
    'PVA-5 G90 1.3 KCl';...
    'PVA-5 G90 pH 5';...
    'PVA-5 G90 pH 7';...
    'PVA-5 G90 pH 9';...
    'PVA-2 Glycine'};
color_all_Vt = RGBtoMHex('88A96A');
color_all_It = RGBtoMHex('D8EBAD');
fig_all = make_figures(Vt_avg_T, (-1)*It_avg_T, Vt_sd_T, It_sd_T, 10^9, sample_names, color_all_Vt, color_all_It, 35);

%% --------------------------------------------------------------------
%% Figure with PVA Data
sample_names_PVA = sample_names(1:6, 1);
Vt_avg_PVA = Vt_avg_T(1:6, 1);
It_avg_PVA = It_avg_T(1:6, 1);
Vt_sd_PVA = Vt_sd_T(1:6, 1);
It_sd_PVA = It_sd_T(1:6, 1);
color_PVA_Vt = RGBtoMHex('D67887');
color_PVA_It = RGBtoMHex('F4BFCD');
fig_PVA = make_figures(Vt_avg_PVA, (-1)*It_avg_PVA, Vt_sd_PVA, It_sd_PVA, 10^9, sample_names_PVA, color_PVA_Vt, color_PVA_It, 15);


%% --------------------------------------------------------------------
%% Figure with NaCl/KCl Data
sample_names_NK = sample_names([1 7:8], 1);
Vt_avg_NK = Vt_avg_T([1 7:8], 1);
It_avg_NK = It_avg_T([1 7:8], 1);
Vt_sd_NK = Vt_sd_T([1 7:8], 1);
It_sd_NK = It_sd_T([1 7:8], 1);
color_NK_Vt = RGBtoMHex('8F9F7B');
color_NK_It = RGBtoMHex('D0D8AA');
fig_NK = make_figures(Vt_avg_NK, (-1)*It_avg_NK, Vt_sd_NK, It_sd_NK, 10^9, sample_names_NK, color_NK_Vt, color_NK_It, 0);


%% --------------------------------------------------------------------
%% Figure with pH Data
sample_names_pH = sample_names([1 9:11], 1);
Vt_avg_pH = Vt_avg_T([1 9:11], 1);
It_avg_pH = It_avg_T([1 9:11], 1);
Vt_sd_pH = Vt_sd_T([1 9:11], 1);
It_sd_pH = It_sd_T([1 9:11], 1);
color_pH_Vt = RGBtoMHex('8FB3A1');
color_pH_It = RGBtoMHex('CCE0D8');
fig_pH = make_figures(Vt_avg_pH, (-1)*It_avg_pH, Vt_sd_pH, It_sd_pH, 10^9, sample_names_pH, color_pH_Vt, color_pH_It, 15);



%% --------------------------------------------------------------------
%% Figure with glycine Data
sample_names_G = sample_names([1 12], 1);
Vt_avg_G = Vt_avg_T([1 12], 1);
It_avg_G = It_avg_T([1 12], 1);
Vt_sd_G = Vt_sd_T([1 12], 1);
It_sd_G = It_sd_T([1 12], 1);
color_G_Vt = RGBtoMHex('A6C681');
color_G_It = RGBtoMHex('C5E6A0');
fig_G = make_figures(Vt_avg_G, (-1)*It_avg_G, Vt_sd_G, It_sd_G, 10^9, sample_names_G, color_G_Vt, color_G_It, 0);



%% Modified Figure with KCl/NaCl
% Modified to include other molarities of KCl/NaCl
% Should not be done because the others do not have gelatin
% 
% sample_names_NKM = {sample_names{1};...
%     sample_names{7};...
%     sample_names{8};...
%     '0.9 NaCl';...
%     '0.9 KCl';...
%     '0.5 NaCl';...
%     '0.5 KCl'};
% Vt_avg_NKM = [Vt_avg_T([1 7:8], 1); -1.26994; -2.02954; -4.05063; -2.93956];
% It_avg_NKM = [It_avg_T([1 7:8], 1); 4.56093*10^-9; 5.39057*10^-9; 20.84808*10^-9; 9.43153*10^-9];
% Vt_sd_NKM = [Vt_sd_T([1 7:8], 1); 0.2775; 0.36162; 0.05035; 0.34922];
% It_sd_NKM = [It_sd_T([1 7:8], 1); 0.56557*10^-9; 0.99349*10^-9; 1.04791*10^-9; 1.94893*10^-9];
% color_NKM_Vt = RGBtoMHex('75C3F8');
% color_NKM_It = RGBtoMHex('DAF5FD');
% fig_NKM = make_figures(Vt_avg_NKM, (-1)*It_avg_NKM, Vt_sd_NKM, It_sd_NKM, 10^9, sample_names_NKM, color_NKM_Vt, color_NKM_It, 30);
% 0.9 NaCl	-4.56092	0.56557	--	--	-1.26994	0.2775
% 0.9 KCL	-5.39057	0.99349	--	--	-2.02954	0.36162
% 0.5 NaCl	-20.84808	1.04791	--	--	-4.05063	0.05035
% 0.5 KCl	-9.43153	1.94893	--	--	-2.93956	0.34922


%% SAVING PLOTS
saveas(fig_all, '/Users/bao48/Desktop/bao48/research/Akron/figures/20180928/all_samples.jpg');
saveas(fig_PVA, '/Users/bao48/Desktop/bao48/research/Akron/figures/20180928/PVA_samples.jpg');
saveas(fig_NK, '/Users/bao48/Desktop/bao48/research/Akron/figures/20180928/NK_samples.jpg');
saveas(fig_pH, '/Users/bao48/Desktop/bao48/research/Akron/figures/20180928/pH_samples.jpg');
saveas(fig_G, '/Users/bao48/Desktop/bao48/research/Akron/figures/20180928/G_samples.jpg');



