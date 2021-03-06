library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity change1 is
port(k3:in std_logic;
	mode:in std_logic;
    second:in std_logic_vector(7 downto 0);
	minute:in std_logic_vector(7 downto 0);
	hour:in std_logic_vector(7 downto 0);
	day:in std_logic_vector(7 downto 0);
	month:in std_logic_vector(7 downto 0);
	year_h:in std_logic_vector(7 downto 0);
	year_l:in std_logic_vector(7 downto 0);
	alarm_minute:in std_logic_vector(7 downto 0);
	alarm_hour:in std_logic_vector(7 downto 0);
    q:out std_logic_vector(31 downto 0));
end entity;
architecture behav of change1 is
signal key_value:std_logic_vector(1 downto 0);
begin
	process(k3)
    begin 
		if(k3'event and k3='1') then
				key_value<=key_value+'1'; 
				if key_value="01" then 
				key_value<="00"; 
				end if; 
		end if; 
	end process;
    process(mode,key_value,second,minute,hour,day,month,year_h,year_l,alarm_hour,alarm_minute)
	begin
	case mode is
		when '0'=>
		if key_value="00" then
			q<="00000000"&hour&minute&second;
		else
			q<=year_h&year_l&month&day;
		end if;
		when '1'=>
			q<="00000000"&alarm_hour&alarm_minute&"00000000";
	end case;
	end process;
end behav;