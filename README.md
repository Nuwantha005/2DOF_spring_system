# Introduction


<img src="https://github.com/Nuwantha005/2DOF_spring_system/assets/132461834/5b7fcbb4-3ce3-4a29-b002-e13a6fc13ea8" alt="drawing" style="width:1000px;"/>


This figure shows schematic illustration of a 2DOF damped vibration system. After applying Newton's equations of motion to system
we can obtain the following two differential equations that are coupled and are in second order.

$$ m_1\ddot x_1 + (c_1+c_2)\dot x_1 - c_2 \dot x_2 + (k_1+k_2)x_1 - k_2 x_2 = 0 $$

$$ m_2\ddot x_2 - c_2 \dot x_1 + (c_2 +c_3) \dot x_2 - k_2 x_1 +(k_2 + k_3) x_2 = 0 $$

They can be represented in Matrix form as follows.

$$ 
\begin{bmatrix} m_1 & 0 \\\ 0 & m_2 \end{bmatrix} \begin{Bmatrix} \ddot x_1 \\\ \ddot x_2 \end{Bmatrix} + 
\begin{bmatrix} c_1+c_2 & -c_2 \\\ -c_2 & c_2+c_3 \end{bmatrix} \begin{Bmatrix} \dot x_1 \\\ \dot x_2 \end {Bmatrix} +
\begin{bmatrix} k_1+k_2 & -k_2 \\\ -k_2 & k_2+k_3 \end{bmatrix} \begin{Bmatrix} x_1 \\\ x_2 \end{Bmatrix} = 
\begin{Bmatrix} 0 \\\ 0 \end{Bmatrix}
$$

it can aslo be represented in short for like this.

$$ [m] \ddot{\vec x}(t) + [c] \dot{\vec x}(t) + [k] \vec x(t) = 0 $$

here [m], [c], [k] are mass, damping and stiffness matrices respectively. Solving these in matrix form using MATLAB is easier because of 
functions like eig() can be used to directly find natural frequencies. This system can also be taken into multi DOF system due to the 
ease of using matrixes to data manupulation.

# Variables
- m1,m2,m3: values for masses
- c1,c2c,c3: damping coefficients
- k1,k2,k3: spring constanats
- q: initial positions matrix
- qdot: initial velocities matrix
- U: modal matrix

There is also the ability to save the animation using videoObject. lectureExample_animated.m contains initial unoptimized code that draws the graphs
in every loop cycle. optimized.m contains more optimized code that does only the moving parts inside the for loop.

# Example
This example is animates and plots the behaviour of an undamped system tuned to the real time, meaning 8 seconds in animation is 8 seconds in real time. It was achieved by using 50fps framerate and
1/800 step sizem skipping half of the frames in between. Physical constants and initial conditions are as same as in uploaded file.


<img src="https://github.com/Nuwantha005/2DOF_spring_system/assets/132461834/caa75043-e1bc-4d13-967d-2d208ebf7c95" alt="example" style="width:1000px;"/>


# References
Figure 5.5: S. S. Rao and P. Griffin, Mechanical vibrations. Harlow Pearson, 2018.
