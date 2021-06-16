from make_spec_data import spec_data
import matplotlib.pyplot as plt
import numpy as np

x = np.arange(0, 64, 1)

y = np.arange(0, 64, 1)

xx, yy = np.meshgrid(x, y, sparse=True)

# z = np.sin(xx**2 + yy**2) / (xx**2 + yy**2)   # z = sin(x² + y²)
#                                               #      (x² + y²)

z = spec_data()

plt.title('Spectrogram')
plt.xlabel('Time')
plt.ylabel('Frequency')
plt.contourf(x,y,abs(z))

plt.show()