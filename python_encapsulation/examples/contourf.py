import matplotlib.pyplot as plt
import numpy as np

x = np.arange(-5, 5, 0.1)

y = np.arange(-5, 5, 0.1)

xx, yy = np.meshgrid(x, y, sparse=True)

z = np.sin(xx**2 + yy**2) / (xx**2 + yy**2)   # z = sin(x² + y²)
                                              #      (x² + y²)

plt.contourf(x,y,z)

plt.show()