# # #
# # #		Function Generator 
# # #
# # #	Author:		Ziga M 
# # #	Date: 		27.07.2019
# # #

import os
import time
from FunctionGeneratorProtocol import ComPort





if __name__ == "__main__":

	# Clear cmd
	os.system("cls")

	# Serial Port
	serPort = ComPort()
	serPort.p_open()
	
	
	
	'''
	while True:
		
		#serPort.p_write([0xAA, 0x55, 0x69, 0x96, 0x04, 0x00, 0x01, 0x02, 0x03, ( 0x00 ^0x01 ^ 0x02 ^ 0x03 )])
		serPort.p_write([0xAA])
		print( "Writing to port...\n" )
		print( "Reading from port: %s " % serPort.p_read(1) )
		time.sleep( 1.0 )
		
	'''
	
	
	
	# Close port
	serPort.p_close()
	
	