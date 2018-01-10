function sim = gaussianKernel(x1, x2)

delta=10;
sim=exp(norm(x1-x2)^2*(-0.5)/delta^2);