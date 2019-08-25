import os
import numpy as np
import matplotlib.pyplot as plt


# # # Number of elements in LUT
N = 50

# # # DAC resolution ( in bits )
DAC_RES = 10	



if __name__ == "__main__":
	
	n = 0.0
	sin_lut = []
	n_plt = []
	
	print ("uint16_t sin_lut[%s] = {" % N )
	
	for i in range(N):
	
		# # # Calculate sinus value
		sin_val = ( np.sin( n ) + 1 ) * (( 2**( DAC_RES - 1 ) - 1 )) + 500
		n += ( 2 * np.pi / N )
		
		# # # Verilog syntax 
		#print("sin_lut[%s] <= 12'd%i;" % ( i, sin_val ))
		print("%i," % sin_val)
		
		# # # Fill array
		sin_lut.append( sin_val )
		n_plt.append( n / ( 2 * np.pi ) )
		
	print("};")
		
		
	# # # Show wave
	plt.plot(n_plt, sin_lut, "-o")
	plt.grid()
	plt.show()