# # #
# # #		Function Generator Defines
# # #
# # #	Author:		Ziga M 
# # #	Date: 		10.08.2019
# # #


# # # Defines 
class FunctionGeneratorDefines:


	# # # COM Port defines
	
	# Serial name
	COM_SERIAL_NAME 	= "FUNGEN"
 
	# Baudrate
	COM_BAUDRATE		= 115200
	
	# Timeout
	COM_TIMEOUT			= 0.100	# s
	
	
	
	# # # Protocol defines
	
	# Header 
	PROT_HEADER					= "\xAA\x55"
	PROT_HEADER_bp				= 0
	PROT_HEADER_size			= 2
	PROT_HEADER_msk				= ( 0xFFFF << PROT_HEADER_bp )
	
	
	# Lenght bit mask
	PROT_LEN_bp					= ( PROT_HEADER_bp + PROT_HEADER_size )
	PROT_LEN_msk				= ( 0xFF << PROT_LEN_bp )
	PROT_LEN_size				= 1
	
	# Waveform code
	PROT_WAVEFORM_bp			= ( PROT_LEN_bp + PROT_LEN_size )
	PROT_WAVEFORM_msk			= ( 0xFF << PROT_WAVEFORM_bp )
	PROT_WAVEFORM_size			= 1
	
	# Frequency 
	PROT_FREQ_bp				= ( PROT_WAVEFORM_bp + PROT_WAVEFORM_size )
	PROT_FREQ_msk				= ( 0xFFFFFF << PROT_FREQ_bp )
	PROT_FREQ_size				= 3
	
	# CRC
	PROT_CRC_bp					= ( PROT_FREQ_bp + PROT_FREQ_size )
	PROT_CRC_msk				= ( 0xFF << PROT_CRC_bp )
	PROT_CRC_size 				= 1
	
	
	
	# # # Waveform defines
	
	# Waveform code
	WAVE_SINE_code				= ( 0xC0 )
	WAVE_SQRT_code				= ( 0xC1 )
	WAVE_RECT_code				= ( 0xC2 )
	WAVE_SAW_code				= ( 0xC3 )
	
	
	# # # CLI commands
	
	# Quit command
	CLI_QUIT_cmd				= "quit"
	
	# Info command
	CLI_INFO_cmd				= "get info"
	
	# Help command
	CLI_HELP_cmd				= "help"
	
	# Set commands
	CLI_SET_WAVEFORM_cmd		= "set"
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	