import numpy as np
import matplotlib.pyplot as plt
import math
def argminf(x1, x2):
    r = np.exp(1-x1-x2)+np.exp(x1+x2-1)+x1**2+x1*x2+x2**2+x1-3*x2
    return r
def deriv_x(x1, x2):
    r1 = -np.exp(1-x1-x2)+np.exp(x1+x2-1)+2*x1+x2+1
    r2 = -np.exp(1-x1-x2)+np.exp(x1+x2-1)+x1+2*x2-3
    return r1, r2
def gradient_descendent(n,list1,list2):
    alpha = 0.1  # step size
    x1, x2 = 0,0  # the initial
    for i in range(n):
        deriv1, deriv2 = deriv_x(x1,x2)
        list1.append(x1)
        list2.append(x2)
        x1 = x1 - alpha * deriv1
        x2 = x2 - alpha * deriv2
        deriv1, deriv2 = deriv_x(x1,x2)
        judge = math.sqrt(deriv1**2 + deriv2**2)
        if judge < 0.00001:
            return x1,x2,i,list1,list2
    return x1,x2,i,list1,list2
list1 = []
list2 = []
[x1,x2,num,list1,list2] = gradient_descendent(1000,list1,list2)
print("x1:",x1)
print("x2:",x2)
print("number of iterations:",num)
print("objective function value:",np.exp(1-x1-x2)+np.exp(x1+x2-1)+x1**2+x1*x2+x2**2+x1-3*x2)
X1 = np.arange(-2.5, 0.5, 0.1)
X2 = np.arange(0, 3, 0.1)
[x1,x2] = np.meshgrid(X1,X2)
plt.plot(list1,list2,linewidth = 1, color = 'green')
plt.plot(list1,list2,'r*')
plt.contour(x1,x2,argminf(x1,x2),50)
plt.show()
