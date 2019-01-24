function linehandle = plot_return(datas,line_color,fill_color,smooth_count)
datas.timesteps = double(datas.timesteps);
datas.smoothed_returns_mean = smooth(datas.returns,smooth_count,'moving');
datas.smoothed_returns_mean = datas.smoothed_returns_mean.';
datas.smoothed_returns_std = datas.returns - datas.smoothed_returns_mean;
datas.smoothed_returns_std = datas.smoothed_returns_std .^ 2;
datas.smoothed_returns_std = smooth(datas.smoothed_returns_std,smooth_count,'moving');
datas.smoothed_returns_std = datas.smoothed_returns_std .^0.5;
datas.smoothed_returns_std = datas.smoothed_returns_std.';
linehandle = plot(datas.timesteps, datas.smoothed_returns_mean, 'Color',line_color);
hold on;
jbfill(datas.timesteps, datas.smoothed_returns_mean + datas.smoothed_returns_std,datas.smoothed_returns_mean - datas.smoothed_returns_std,fill_color);
xlabel('timesteps');
ylabel('return');
hold off;
end

