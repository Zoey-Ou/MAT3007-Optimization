import numpy as np
import math
import matplotlib.pyplot as plt
def argminf(x1, x2):
    r = np.exp(1-x1-x2)+np.exp(x1+x2-1)+x1**2+x1*x2+x2**2+x1-3*x2
    return r
def deriv_x(x1, x2):
    r1 = -np.exp(1-x1-x2)+np.exp(x1+x2-1)+2*x1+x2+1
    r2 = -np.exp(1-x1-x2)+np.exp(x1+x2-1)+x1+2*x2-3
    return r1, r2
def hessian_matrix(x1,x2):
    r11 = np.exp(1-x1-x2)+np.exp(x1+x2-1)+2
    r12 = np.exp(1-x1-x2)+np.exp(x1+x2-1)+1
    r21 = np.exp(1-x1-x2)+np.exp(x1+x2-1)+1
    r22 = np.exp(1-x1-x2)+np.exp(x1+x2-1)+2
    return  np.array([[r11,r12],[r21,r22]])
def decide_alpha(deriv1, deriv2, x1, x2, dk):
    beta = 0.5
    t = 1
    dk1, dk2 = dk
    while(True):
        x1_next = x1 + t*dk1
        x2_next = x2 + t*dk2
        if argminf(x1_next,x2_next)<=argminf(x1,x2)+0.5*t*(deriv1*dk1+deriv2*dk2):
            return t
        else:
            t = t*beta
def newton_method(n,list1,list2):
    x1, x2 = 0, 0    # initial value of x
    for i in range(n):
        deriv1, deriv2 = deriv_x(x1, x2)
        dk = -np.dot(np.array([deriv1, deriv2]),np.linalg.inv(hessian_matrix(x1,x2)))
        alpha = decide_alpha(deriv1, deriv2, x1, x2, dk)
        list1.append(x1)
        list2.append(x2)
        x1, x2= np.array([x1,x2]) - alpha*np.dot(np.array([deriv1, deriv2])
        ,np.linalg.inv(hessian_matrix(x1,x2)))
        judge = math.sqrt(deriv1**2+deriv2**2)
        if judge < 0.00001:
            return x1, x2, i, list1, list2
    return x1, x2, i, list1, list2
list1=[]
list2=[]
[x1, x2, num, list1, list2] = newton_method(1000, list1, list2)
print("x1:",x1)
print("x2:",x2)
print("number of iterations:",num)
print("objective function value:",np.exp(1-x1-x2)+np.exp(x1+x2-1)+x1**2+x1*x2+x2**2+x1-3*x2)
X1 = np.arange(-2.5, 0.5, 0.1)
X2 = np.arange(0, 3, 0.1)
[x1 ,x2] = np.meshgrid(X1, X2)
plt.plot(list1,list2,linewidth=1, color='green')
plt.plot(list1,list2,"r*")
plt.contour(x1, x2, argminf(x1, x2), 50)
plt.show()

