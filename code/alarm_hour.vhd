Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity alarm_hour is 
Port(clk,reset:in std_logic;
    q:out std_logic_vector(7 downto 0));
end entity;
architecture behav of alarm_hour is
begin
process(clk)
variable r:std_logic_vector(7 downto 0); 
begin
		if reset='1' then r:="00000000";
		elsif (rising_edge(clk)) then
			r:=r+1;
			if r(3 downto 0)=4 and r(7 downto 4)=2 then
				r(3 downto 0):="0000";r(7 downto 4):="0000";
			elsif r(3 downto 0)=9  then
				r(3 downto 0):="0000";r(7 downto 4):=r(7 downto 4)+1;
			end if;
		end if;	
		q<=r;	 
end process;
end behav;