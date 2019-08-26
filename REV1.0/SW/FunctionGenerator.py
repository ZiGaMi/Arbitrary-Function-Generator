# # #
# # #		Function Generator 
# # #
# # #	Author:		Ziga M 
# # #	Date: 		27.07.2019
# # #

import os
import sys
import time
from FunctionGeneratorProtocol import ComPort
from FunctionGeneratorDefines import FunctionGeneratorDefines


Defines = FunctionGeneratorDefines()

# # # Intro 
def cliIntro(p, s):
	print("////////////////////////////////////////////////////////////////")
	print("//")
	print("//		Function Generator Rev1.0")
	print("//")
	print("//")
	print("//")
	print("//  COM port: %s (%s)" % ( p, s))
	print("//  FW version: 0.0")
	print("//  SoC version: 0.0")
	print("//")
	print("////////////////////////////////////////////////////////////////")
	print("")


if __name__ == "__main__":

	# Clear cmd
	os.system("cls")

	# Serial Port
	serPort = ComPort()
	port, ser_num = serPort.p_open()
	
	# CLI intro
	cliIntro(port, ser_num)
	
	
	while True:
		
		cmd = input("<FUNGEN>")
	
		if cmd == Defines.CLI_QUIT_cmd:
			sys.exit()
			
		elif cmd == Defines.CLI_HELP_cmd:
			print("Help menu")
			
		elif cmd == Defines.CLI_INFO_cmd:
			print("Getting info...")
			
		elif cmd[:3] == "set":
			if cmd[4:8] == "sine":
				pass
			elif cmd[4:8] == "sqrt":
				pass
			elif cmd[4:8] == "rect":
				pass
			elif cmd[4:7] == "saw":
				pass
				
		else:
			print("Unknown command... (enter >help< )")
	
	
	# Close port
	serPort.p_close()
	
	
	
	
	

	
	
	
	
	