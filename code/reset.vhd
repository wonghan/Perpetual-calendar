Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity reset is 
Port(k0,k1:in std_logic;
    c:out std_logic);
end entity;
architecture behav of reset is
begin
process(k0,k1)
variable r:std_logic_vector(7 downto 0); 
begin
	if((k0='1')and (k1='1'))then 
		c<='0';
	else c<='1';
	end if;
end process;
end behav;