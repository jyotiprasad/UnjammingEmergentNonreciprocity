# -*- coding: utf-8 -*-
"""

"""

### For details of the numerical method used here please see: https://www.ctcms.nist.gov/fipy/

from fipy import (CellVariable, PeriodicGrid1D, Viewer, TransientTerm, DiffusionTerm,
                  UniformNoiseVariable, LinearLUSolver, numerix,
                  ImplicitSourceTerm, ExponentialConvectionTerm, Variable)

import sys
import inspect

import matplotlib.pyplot as plt
import numpy as np
import scipy.ndimage

from scipy.optimize import curve_fit
from scipy.signal import correlate
from scipy.stats import kurtosis
from scipy.interpolate import interp1d

numerix.random.seed(2)

def run_simulation(f0, Total_time):

    # Define mesh size and number of points
    nx = 200
    L = 100
    dx = L / nx
    
    mesh = PeriodicGrid1D(dx, nx)
    
    # Variables to use
    v = CellVariable(name='v', mesh=mesh, hasOld=1)
    m = CellVariable(name='m', mesh=mesh, hasOld=1)
    
    # Initial condition
    m.setValue(UniformNoiseVariable(mesh=mesh, minimum=0.6215, maximum=0.6225))
    v.setValue(UniformNoiseVariable(mesh=mesh, minimum=0, maximum=0.00001))

    # parameters
    B=-6.0
    Gamma=1.0
    gamma=1.0
    Dm=0.005
    c0=10.0
    C=c0
    y0=10.0
    R0=Variable(value=y0)
    sigma = 1.0
    dt = 0.05

    vm=(B/Gamma) * m.grad.dot([[1.0]])*(m)
    vm.name = 'vm'

    #------------- dirac delta function ---------------

    def delta_func_2(x,x0,epsilon,Lsys):
        yy=[0]*len(x)
        for i in range(len(x)):
            if (abs(x[i]-x0)>Lsys/2):
               xx=Lsys-(x[i]-x0)
            if (abs(x[i]-x0)<Lsys/2):
               xx=x[i]-x0
            yy[i]=np.exp(-((xx)*(xx))/(2*epsilon*epsilon))/(np.sqrt(2*np.pi)*epsilon)
        newyy=np.array(yy,dtype=float)
        return newyy

    def delta_func_3(x,x0,epsilon,Lsys):
        xx = ((L - (x - x0)) * (abs(x - x0) > Lsys / 2)
              + (x - x0) * (abs(x - x0) < Lsys / 2))
        return (numerix.exp(-xx**2 / (2 * epsilon**2))
                / (np.sqrt(2*np.pi)*epsilon))

    def delta_func_4(x,x0,epsilon,Lsys):
        if (x0<=Lsys/2):
           xx = ((L - (x - x0)) * (abs(x - x0) > Lsys / 2)
               + (x - x0) * (abs(x - x0) < Lsys / 2))
           return (numerix.exp(-xx**2 / (2 * epsilon**2))
                  / (np.sqrt(2*np.pi)*epsilon))
        if (x0>Lsys/2):
           xx = ((x + x0) * (abs(x - x0) > Lsys / 2)
               + (x - x0) * (abs(x - x0) < Lsys / 2))
           return (numerix.exp(-xx**2 / (2 * epsilon**2))
                  / (np.sqrt(2*np.pi)*epsilon))

    #---------------- grad function -------------------
    def gradfunc(y,x,dx, c0, r0):
        idx2=len(x)-1
        dydx = np.gradient(y, x, edge_order=2)
        xx=x-(dx/2.0)
        idx = np.argmin(np.abs(xx - r0))
        if (xx[idx] <= r0):
           idx1=idx
           idx2=idx+1
        if (xx[idx] > r0):
           idx1=idx-1
           idx2=idx
        if (idx2==len(x)):
           idx2=len(x)-1

        mdydx = 0.5*(dydx[idx1]+dydx[idx2])
        my = 0.5*(y[idx1]+y[idx2])

        return c0*my*mdydx
        


    ############## equations #############
    # renormalized parameters by Gamma
    
    #       Gamma * v = B rho(grad(rho)) + f * delta(r-R),     B<0, f>0, Gamma>0
    #       dot(rho) + del.(v rho) = 0
    #       dot(R) = (f/gamma)*(n-cap) - (C/gamma) * rho(grad(rho))      C>0

    # Gamma=gamma=1,  B' = B/Gamma, C'=C/gamma, f'=f/Gamma

    ######################################

    eq_m = (TransientTerm(var=m) + ExponentialConvectionTerm(coeff=[[1.0]] * v, var=m) ==  DiffusionTerm(coeff=Dm, var=m))

    eq_v = (ImplicitSourceTerm(coeff=1., var=v) == (B/Gamma) * m.grad.dot([[1.0]])*(m) + (f0/Gamma) * delta_func_4(mesh.x,R0, sigma, L))

    eq = eq_m & eq_v

    #viewer = Viewer(vars=(v, m, vm))

    elapsed = 0.0
    
    ms = []
    vs = []
    Rs = []
    
    while elapsed < Total_time:
        # Old values are used for sweeping when solving nonlinear values
        v.updateOld()
        m.updateOld()

        print(elapsed, R0)

        # solve ode
        y0 = y0+((f0/gamma) - gradfunc(m.value,mesh.x.value,dx, C, R0))*dt
        if(y0>L):
          y0=y0-L

        if(y0<0):
          y0=y0+L

        R0.setValue(y0)
    #---- save R0 in file for later input ----
        file1 = open("param.txt","w")
        file1.write("%f" % R0)
        file1.close()

        
        elapsed += dt
        
        res = 1e5
        old_res = res * 2
        step = 0
        while res > 1e-5 and step < 5 and old_res / res > 1.01:            
            old_res = res
            res = eq.sweep(dt=dt)
            step += 1
        
    #---- take R0 input from file ----
        dum=np.loadtxt('param.txt')
        R0.setValue(dum)

        # The variable values are just numpy arrays so easy to use!
        vs.append(v.value.copy())
        ms.append(m.value.copy())
        Rs.append(R0.value.copy())

        #viewer.plot()

        
    return ms, vs, Rs

if __name__ == '__main__':

    path = 'result/'

    Total_time=40
    
    f0 = 2
    ms, vs, Rs = run_simulation(f0,Total_time)

    name = 'f0_{:.4f}'.format(f0)
        
    y = np.array([ms, vs])
    #np.save(path + name, y)

    plt.imshow(ms, aspect='auto', interpolation='bicubic', cmap='jet', extent=[-25, 25, Total_time, 0])
    #plt.plot([4.5, 4.5, 5.5, 5.5, 4.5], [signal_start, signal_end, signal_end, signal_start, signal_start], color='w', ls='--')
    plt.colorbar(label='density m')
    plt.xlabel(r'$x $')
    plt.ylabel(r'$t$ $(s)$')
    plt.gcf().savefig(path + 'rho_'+name+'.png', format='png', bbox_inches='tight')    
    plt.clf()

#---------------------------------------------
    plt.imshow(vs, aspect='auto', interpolation='bicubic', cmap='jet', extent=[-25, 25, Total_time, 0])
    #plt.plot([4.5, 4.5, 5.5, 5.5, 4.5], [signal_start, signal_end, signal_end, signal_start, signal_start], color='w', ls='--')
    plt.colorbar(label='velocity v')
    plt.xlabel(r'$x $')
    plt.ylabel(r'$t$ $(s)$')
    plt.gcf().savefig(path + 'vel_'+name+'.png', format='png', bbox_inches='tight')    
    plt.clf()


#---------------------------------------------

    tp0=750
    vt=y[1,tp0,:]
    mt=y[0,tp0,:]
    xx = np.linspace(0, 100, len(mt))-Rs[tp0]
    plt.plot(xx,mt)
    plt.gcf().savefig(path + 'mx_'+name+'.png', format='png', bbox_inches='tight')    
    plt.clf()
    plt.plot(xx,vt)
    plt.gcf().savefig(path + 'vx_'+name+'.png', format='png', bbox_inches='tight')    
    plt.clf()

    file1 = open("v_x.txt","w")
    for i in range(len(vt)):
        file1.write(str(xx[i]) + " " + str(vt[i]) + "\n")
    file1.close()

    file1 = open("m_x.txt","w")
    for i in range(len(mt)):
        file1.write(str(xx[i]) + " " + str(mt[i]) + "\n")
    file1.close()





