# # #
# # #		Function Generator Protocol
# # #
# # #	Author:		Ziga M 
# # #	Date: 		27.07.2019
# # #

import serial
import serial.tools.list_ports


class ComPort:
	
	def __init__(self):
		self.port 				= serial.Serial()
		self.port.baudrate 		= 115200
		self.port.timeout		= 0.100
		self.port.bytesize 		= serial.EIGHTBITS
		self.port.parity		= serial.PARITY_NONE
		self.port.stopbits 		= serial.STOPBITS_ONE
		
	def p_open(self):
		print( "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ")
		print( " LIST OF COM PORTS ")
		print( "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \n")
		for port in serial.tools.list_ports.comports():
			print( "[" + str( port )[3] + "] - " + str( port ) + "\n")
		
		# Select COM port
		print("Select COM port number: ")
		self.port.port = "COM" + input()
		
		# Open port
		try:
			self.port.open()
			print( "COM port successfully open..." )
		except Exception as e:
			print( e )
			
	
	def p_write(self, val):
		self.port.write(val)
		
	def p_read(self, num):
		return self.port.read(num)