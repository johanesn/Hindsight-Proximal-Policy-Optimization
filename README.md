# Hindsight-Proximal-Policy-Optimization

![HPPO](/img/methodonediagram.png)

![GoalGenerator](/img/methodtwodiagram.png)

In this repository, we implement our proposed method called hindsight proximal policy optimization for both dense reward and sparse reward environment. 

The purpose of our proposed method in here is to embed subgoal for on-policy reinforcement learning algorithm. Since, the original idea utilizing experience replay,  it can only be implemented in off-policy method. One of off-policy biggest weakness is by alternating between two different policies, the stability trait here is very poor. This result is very well analyzed under the benchmarking table for continuous control paper. Our model consists of modifying generalized advantage estimation (GAE) with importance sampling and simplifying the way to generate better goal rather than using generative adversarial network (GAN).


# Environment Description
- OpenAI gym classical control 'Pendulum-v0'
- Bit Flipping
- OpenAI gym with mujoco 'FetchReach' (on-going)

# Hardware Setting
- Framework
    - Pytorch 0.4.1
    - Ubuntu 16.04.5 LTS

- Hardware
    - CPU: Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
    - RAM: DDR42133 MHz 16GB
    - GPU: Tesla P100-PCIE 16GB
    - CUDA Version: 8.0.61

# Experimental Results

### Pendulum
