# # #
# # #		Function Generator Protocol
# # #
# # #	Author:		Ziga M 
# # #	Date: 		27.07.2019
# # #

import serial
import serial.tools.list_ports
from FunctionGeneratorDefines import FunctionGeneratorDefines


Defines = FunctionGeneratorDefines()

# # # Serial COM port class 
# # # In here are simple methods for input/output of serial communication
class ComPort:
	
	def __init__(self):
	
		# Com port settings
		self.port 				= serial.Serial()
		self.port.baudrate 		= Defines.COM_BAUDRATE
		self.port.timeout		= Defines.COM_TIMEOUT
		self.port.bytesize 		= serial.EIGHTBITS
		self.port.parity		= serial.PARITY_NONE
		self.port.stopbits 		= serial.STOPBITS_ONE
		
		
	# Open COM port 
	# Automagically opens COM port with COM_SERIAL_NAME string description
	def p_open(self):
		
		for port in serial.tools.list_ports.comports():			
			if ( port.serial_number.find(Defines.COM_SERIAL_NAME) != -1 ):
				self.port.port = port.device
				port_serial_number = port.serial_number			
		
		# Open port
		try:
			self.port.open()
			print( "%s (%s) successfully open..." % (self.port.name, port_serial_number))
		except Exception as e:
			print( e )
			
	
	# Write bytearray to COM port
	def p_write(self, val):
		self.port.write(val)
		
		
	# Read number of bytes 
	def p_read(self, num):
		return self.port.read(num)
		
	
	# Close COM port
	def p_close(self):
		self.port.close()
		
		
		
		
		
# # # Protocol description
# # # In here protocol packets are defines and process
class Protocol:
	pass
	
	
