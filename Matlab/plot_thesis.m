clear;
clc;

timesteps = 1:929;
save('test_rewards_ppo_pendulum.mat','timesteps','-append');
PPO_pendulum = load(['test_rewards_ppo_pendulum.mat']);
timesteps = 1:395;
save('test_rewards_hppo_pendulum.mat','timesteps','-append');
HPPO_pendulum = load(['test_rewards_hppo_pendulum.mat']);
timesteps = 1:1335;
save('test_rewards_hbppo_pendulum.mat','timesteps','-append');
HBPPO_pendulum = load(['test_rewards_hbppo_pendulum.mat']);
timesteps = 1:208;
save('test_rewards_mbppo_pendulum.mat','timesteps','-append');
MBPPO_pendulum = load(['test_rewards_mbppo_pendulum.mat']);

color_order = get(groot,'defaultAxesColorOrder');
default_orange = color_order(2,:);
light_orange = [1.0000, 0.6275, 0.4784];
default_blue = color_order(1,:);
light_blue = [0.5843, 0.8157, 0.9882];
default_green = color_order(5,:);
light_green = [0.7568, 0.8039, 0.7568];
default_purple = color_order(4,:);
light_purple = [0.5176, 0.4392, 1];

figure;
ppo_line = plot_return(PPO_pendulum,default_orange,light_orange,500);
hold on;
hppo_line = plot_return(HPPO_pendulum,default_blue,light_blue,500);
hold on
hbppo_line = plot_return(HBPPO_pendulum, default_green, light_green, 500);
hold on
mbppo_line = plot_return(MBPPO_pendulum, default_purple, light_purple, 500);
title('Pendulum-v0 Return');
ylabel('Return')
xlabel('Number of episodes')
legend([hppo_line ppo_line hbppo_line mbppo_line],'Hindsight PPO','PPO', 'Hindsight (Beta) PPO', 'Model-Based HPPO', 'Location','southeast')
%axis([0,inf,0,1200]);

timesteps = 1:394;
save('mb_goal_pendulum.mat','timesteps','-append');
mb_goal = load('mb_goal_pendulum.mat');
timesteps = 1:394;
save('sf_goal_pendulum.mat','timesteps','-append');
sf_goal = load('sf_goal_pendulum.mat');

figure;
plot(mb_goal.distance)
hold on
plot(sf_goal.distance)
xlabel('Number of episodes')
ylabel('Distance to desired goal')
title('Pendulum-v0 Goal Distance')
legend('Model-based generator', 'Sample final strategy','Location', 'northeast')

timesteps = 1:28000;
save('test_reward_bitflipping_ppo.mat','timesteps','-append')
save('test_reward_bitflipping_hppo.mat','timesteps','-append')

ppo_bitflipping = load('test_reward_bitflipping_ppo.mat');
hppo_bitflipping = load('test_reward_bitflipping_hppo.mat');

figure;
scatter(ppo_bitflipping.timesteps, ppo_bitflipping.returns)
hold on
scatter(hppo_bitflipping.timesteps, hppo_bitflipping.returns)
xlabel('Number of episodes')
ylabel('Return')
title('Bitflipping with n=8 Mean Return')
legend('PPO', 'Hindsight PPO', 'Location', 'northwest')


save('test_reward_bitflipping_ppo_full.mat','timesteps','-append')
save('test_reward_bitflipping_hppo_full.mat','timesteps','-append')

ppo_bitflipping_full = load('test_reward_bitflipping_ppo_full.mat');
hppo_bitflipping_full = load('test_reward_bitflipping_hppo_full.mat');

figure;

index = (ppo_bitflipping_full.returns == -8.0);
scatter (ppo_bitflipping_full.timesteps(index), ppo_bitflipping_full.returns(index), 'MarkerEdgeColor', (color_order(1,:)+color_order(2,:))/2)

hold on
index_conjugate = (ppo_bitflipping_full.returns ~= -8.0);
scatter(ppo_bitflipping_full.timesteps(index_conjugate), ppo_bitflipping_full.returns(index_conjugate), 'MarkerEdgeColor', color_order(1,:))

hold on

index_conjugate = (hppo_bitflipping_full.returns ~= -8.0);
scatter(hppo_bitflipping_full.timesteps, hppo_bitflipping_full.returns,'MarkerEdgeColor', color_order(2,:))

hold on


index = (hppo_bitflipping_full.returns == -8.0);
scatter (hppo_bitflipping_full.timesteps(index), hppo_bitflipping_full.returns(index),'MarkerEdgeColor', (color_order(1,:)+color_order(2,:))/2)

xlabel('Number of episodes')
ylabel('Return')
title('Bitflipping with n=8 Mean Return')
legend('PPO', 'Hindsight PPO', 'Location', 'northwest')