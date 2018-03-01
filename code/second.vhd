Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity second is 
Port(clk,reset:in std_logic;
    q:out std_logic_vector(7 downto 0);		
    c:out std_logic);
end entity;
architecture behav of second is
begin
process(clk,reset)
variable r:std_logic_vector(7 downto 0); 
begin
		if reset='0' then r:="00000000";
		elsif (rising_edge(clk)) then
			r:=r+1;c<='0';
			if r(3 downto 0)="1010"  then
				r(3 downto 0):="0000";
				if r(7 downto 4)/="0101" then
					r(7 downto 4):=r(7 downto 4)+1;
				elsif r(7 downto 4)="0101"then
					r(7 downto 4):="0000";c<='1';
				end if;
			end if;
		end if;	
		q<=r;	 
end process;
end behav;