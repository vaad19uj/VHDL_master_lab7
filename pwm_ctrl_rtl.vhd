library ieee;
	use ieee.std_logic_1164.all;
	

entity pwm_ctrl is 
	port(
		serial_on			: in std_logic;
		serial_off			: in std_logic;
		serial_up 			: in std_logic;
		serial_down 		: in std_logic;
		
		key_on				: in std_logic;
		key_off				: in std_logic;
		key_up 				: in std_logic;
		key_down 			: in std_logic;
		current_dc_update	: out std_logic;
		ledg0 				: out std_logic;
		-- PWM);

end entity pwm_ctrl;


architecture rtl of pwm_ctrl is

	begin
	
	--	serial_on /key_on 			Go back to previous on state duty cycle (minimum 10%). Reset sets previous duty cycle to 100%. 
	--	serial_off / key_off 		Set current duty cycle to 0%
	--	serial_up / key_up 			Increase duty cycle with 1%, maximum 100%, minimum 10%. I.e. the dutycycle shall be set to 10% 
	--	if current state is off state and up command is received. 
	--	
	--	serial_down / key_down 		Decrease duty cycle with 1%, maximum 100%, minimum 10%. 
	--	This input shall be ignored if PWM output is in off state (at 0%). 
	
	--	The PWM output frequency shall be set to 1000 Hz. 
	--	If any of the serial_* or key_* inputs are set high the PWM duty cycle shall be updated. 
	--	The PWM duty cycle in % shall be output towards the DC Ctrl component on the current_dc vector together with 
	--	one clock cycle high pulse on the current_dc_update signal. 
	--	In the (unlikely) case when both serial_* and key_* signals are activated at the same time the key_ inputs shall have priority. 
	--	The duty cycle of the output signal shall be updated at the end of each period (every ms). 
	--	The PWM period is defined to start with a rising edge on the PWM output and end (+start) with the nextrising edge of the PWM output. 
	--	The timing of the falling edge of the PWM output defines the duty cycle. 
	--	The output PWM duty cycle shall be off (0% after reset). 
	
end architecture rtl;