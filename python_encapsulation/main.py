import numpy as np
import matplotlib.pyplot as plt
from encapsulation import encapsulation

# call encapsulation
blocks = 256    # >= 2
spec_np, spec_fpga = encapsulation(blocks=blocks)

# print the data
x = np.arange(0, blocks)
y = np.arange(0, 64)

fig1 = plt.figure(1)
sub1 = fig1.add_subplot(2, 1, 1)
sub2 = fig1.add_subplot(2, 1, 2)

sub1.title.set_text('NumPy')
sub1.contourf(x, y, abs(spec_np.T))
sub2.title.set_text('FPGA')
sub2.contourf(x, y, abs(spec_fpga.T))

fig1.tight_layout(pad=1.0)

plt.show()
