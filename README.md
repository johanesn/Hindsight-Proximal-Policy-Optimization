# Hindsight-Proximal-Policy-Optimization

![HPPO](/img/methodonediagram.png)

![GoalGenerator](/img/methodtwodiagram.png)

In this repository, we implement our proposed method called hindsight proximal policy optimization for both dense reward and sparse reward environment. 

The purpose of our proposed method in here is to embed subgoal for on-policy reinforcement learning algorithm. Since, the original idea utilizing experience replay,  it can only be implemented in off-policy method. One of off-policy biggest weakness is by alternating between two different policies, the stability trait here is very poor. This result is very well analyzed under the benchmarking table for continuous control paper. Our model consists of modifying generalized advantage estimation (GAE) with importance sampling and simplifying the way to generate better goal rather than using generative adversarial network (GAN).


# Environment Description
- OpenAI gym classical control 'Pendulum-v0'
- Bit Flipping

# Hardware Setting
- Framework
    - Pytorch 0.4.1
    - Ubuntu 16.04.5 LTS

- Hardware
    - CPU: Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
    - RAM: DDR42133 MHz 16GB
    - GPU: Tesla P100-PCIE 16GBfdsf
    - CUDA Version: 8.0.61

# Experimental Results

### Pendulum
![PendulumReturn](/img/pendulumreturn.png =100x200)
Curve in here shows the evaluation of pendulum return 5 times and we take the average value. Result shows our model outperform original ppo and model-based goal generator can boost its sample efficiency.
![GoalDistance](/img/goaldistance.png)
Result in here shows that our network can learn incrementally closer implicit curriculum while sample final method actually generate noisy like distance as expected.

### Bitflipping
![BitflippingReturn](/img/bitflipping8return.png)

Since this is discrete state and action spaces, the training result is not good, highly probable because of hyperparameter tuning. However, our method shows it can outperform original PPO. 
