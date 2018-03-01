Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
Entity alarm_clock is 
Port( second:in std_logic_vector(7 downto 0);
	    minute:in std_logic_vector(7 downto 0);
	    hour:in std_logic_vector(7 downto 0);
        alarm_minute:in std_logic_vector(7 downto 0);
		alarm_hour:in std_logic_vector(7 downto 0);	
        k0:in std_logic;
		clk:in std_logic;
		q:out std_logic);
end entity;
architecture behav of alarm_clock is
begin
	process(clk)
	begin
	if(clk'event and clk='1') then
	if(k0='1') then
            q<='0';
	elsif(hour=alarm_hour) then
		if(minute=alarm_minute) then
			if(second="0000000") then
				q<='1';
			end if;
		end if;
	end if;
	end if;
	end process;
end behav;