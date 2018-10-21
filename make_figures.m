function VtIt = make_figures(Vt, It, Vt_sd, It_sd, It_factor, sample_names, color_Vt, color_It, degrees)
% Vt = array with voltage values (MUST BE COLUMN VECTOR!)
% It = array with current values (MUST BE ROW VECTOR!)
% It_factor = factor to multiply It by (probably 10^9)
% Name = cell, initialized as thus:
% color_Vt and color_It, colors that Vt and It should be
%   Passed as a matrix in the form [68/255, 135/255, 142/255]
% sample_names2 = {'PVA';...
%     'PVA-2 G90';...
%     'PVA-2 G300';...
%     'PVA-7 G90'}
% degrees is how many degrees the top text should be flipped (e.g. 45)

rownum = size(Vt, 1);
placeholder_zeros = zeros(rownum, 1);
plot_data_avg_Vt = [Vt placeholder_zeros];
plot_data_avg_It = [placeholder_zeros It.*It_factor];

It_sd_modified = It_sd.*It_factor;

xlabel_coordinates_Vt = 1:rownum;
xlabel_coordinates_It = 1:rownum;

VtIt = figure;
left_color = [0 0 0];
right_color = [0 0 0];
set(VtIt,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
vtplot = bar(grp2idx(sample_names), plot_data_avg_Vt, 'FaceColor', color_Vt, 'EdgeColor', color_Vt);
xlabel_coordinates_Vt(1, :) = bsxfun(@plus, vtplot(1).XData, [vtplot(1).XOffset]');
x_offset = bsxfun(@plus, placeholder_zeros, [vtplot(1).XOffset]');
ylabel_coordinates_Vt(:, 1) = vtplot(1).YData;
hold on
errorbar(xlabel_coordinates_Vt, ylabel_coordinates_Vt, Vt_sd, '.k');
hold off
ylabel("Voltage (V)");

yyaxis right
itplot = bar(grp2idx(sample_names), plot_data_avg_It, 'FaceColor', color_It, 'EdgeColor', color_It);
xlabel_coordinates_It(1, :) = bsxfun(@plus, itplot(2).XData, (-1)*x_offset(1, 1));
ylabel_coordinates_It(:, 1) = itplot(2).YData;
hold on
errorbar(xlabel_coordinates_It, ylabel_coordinates_It, It_sd_modified, '.k');
hold off
set(gca,'xticklabel', sample_names, 'XTickLabelRotation', degrees, 'FontSize', 15, 'XAxisLocation','top');
legend([vtplot(1) itplot(2)], {'Voltage', 'Current'}, 'Location','southwest');
legend boxoff
set(gca,'defaultAxesColorOrder',[[0 0 0]; [0 0 0]]);
ylabel("Current (nA)", 'Rotation', -90, 'VerticalAlignment','bottom');
end