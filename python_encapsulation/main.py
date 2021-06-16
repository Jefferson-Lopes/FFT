import numpy as np
import matplotlib.pyplot as plt
from encapsulation import encapsulation

# call encapsulation
blocks = 128    # >= 2
spec_np, spec_fpga = encapsulation(blocks=blocks)

# print the data
x = np.arange(0, blocks)
y = np.arange(0, 64)



fig1 = plt.figure(1)
sub1 = fig1.add_subplot(2, 1, 1)
sub2 = fig1.add_subplot(2, 1, 2)

sub1.contourf(x, y, abs(spec_np.T))
sub2.contourf(x, y, abs(spec_fpga.T))

plt.show()










# ######################################
# ## generate the first input signal ##
# ####################################
# TIME = np.arange(0, 8, .125)  #const
# di_re = waves(freq=[0.25], amp=512)
# di_im = waves(freq=[1], amp=0)

# fft_np, fft_fpga = encapsulation(di_re, di_im)


# ######################
# ## start live plot ##
# ####################
# plt.ion()

# fig1 = plt.figure(1)
# sub1 = fig1.add_subplot(2, 1, 1)
# sub2 = fig1.add_subplot(2, 1, 2)
# line1, = sub1.plot(TIME, np.abs(fft_np),  label='NumPy')
# line2, = sub2.plot(TIME, np.abs(fft_fpga), 'r-', label='FPGA')
# fig1.legend()

# for i in range(15):
#     di_re = waves(freq=[0.25 + 2*i/10], amp=512)
#     di_im = waves(freq=[1], amp=0)

#     fft_np, fft_fpga = encapsulation(di_re, di_im)

#     line1.set_ydata(np.abs(fft_np))
#     line2.set_ydata(np.abs(fft_fpga))
#     fig1.canvas.draw()
#     fig1.canvas.flush_events()
