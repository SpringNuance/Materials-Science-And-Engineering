[CdfF,CdfX] = ecdf(Grainasp,'Function','cdf');
BinInfo.rule = 5;
BinInfo.rule = 5;
BinInfo.width = 0.02;
BinInfo.placementRule = 1;
[~,BinEdge] = internal.stats.histbins(Grainasp,[],[],BinInfo,CdfF,CdfX);
[BinHeight,BinCenter] = ecdfhist(CdfF,CdfX,'edges',BinEdge);
figure;
hLine = bar(BinCenter, BinHeight,'hist');
set(hLine,'DisplayName','Grain Shape Data','FaceColor','none','EdgeColor','k','LineStyle','-','LineWidth',1);
hold on;


XLim = get(gca,'XLim');
XLim = XLim + [-1 1] * 0.01 * diff(XLim);
XGrid = linspace(XLim(1), XLim(2),100);

pdaspBeta = fitdist(Grainasp,'Beta');
a_aspBeta = pdaspBeta.a;
b_aspBeta = pdaspBeta.b;
mean_aspBeta = mean(pdaspBeta);
v_aspBeta = std(pdaspBeta);
median_aspBeta = median(pdaspBeta);
YPlot = pdf(pdaspBeta,XGrid);
hLine = plot(XGrid, YPlot, 'Color','r','LineStyle','-','LineWidth',1.5,'DisplayName','Beta distribution');
legend('show','Location','northwest')
xlabel('Grain Shape Aspect Ratio, -', 'fontsize', 15)
xlim([0 1]);
dim = [0.2 0.3 0.3 0.3];
str = {strcat('α = ', num2str(a_aspBeta)),strcat('β = ', num2str(b_aspBeta)),strcat('mean(asp) = ', num2str(mean_aspBeta))};
annotation('textbox',dim,'String',str,'FitBoxToText','on');