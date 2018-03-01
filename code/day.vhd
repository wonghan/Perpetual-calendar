Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity day is 
Port(clk,reset:in std_logic;
	sel:in std_logic_vector(1 downto 0);
    q:out std_logic_vector(7 downto 0);		
    c:out std_logic);
end entity;
architecture behav of day is
begin
process(clk,reset)
variable r:std_logic_vector(7 downto 0); 
begin
		if reset='0' then r:="00000001";
		elsif (rising_edge(clk)) then
			r:=r+1;c<='0';
			case sel is
			when"00"=>
				if r(3 downto 0)=2 and r(7 downto 4)=3 then
					r(3 downto 0):="0001";r(7 downto 4):="0000";c<='1';
				elsif r(3 downto 0)=10  then
					r(3 downto 0):="0000";r(7 downto 4):=r(7 downto 4)+1;
				end if;
			when"01"=>
				if r(3 downto 0)=1 and r(7 downto 4)=3 then
					r(3 downto 0):="0001";r(7 downto 4):="0000";c<='1';
				elsif r(3 downto 0)=10  then
					r(3 downto 0):="0000";r(7 downto 4):=r(7 downto 4)+1;
				end if;
			when"10"=>
				if r(3 downto 0)=10 and r(7 downto 4)=2 then
					r(3 downto 0):="0001";r(7 downto 4):="0000";c<='1';
				elsif r(3 downto 0)=10  then
					r(3 downto 0):="0000";r(7 downto 4):=r(7 downto 4)+1;
				end if;
			when"11"=>
				if r(3 downto 0)=9 and r(7 downto 4)=2 then
					r(3 downto 0):="0001";r(7 downto 4):="0000";c<='1';
				elsif r(3 downto 0)=10  then
					r(3 downto 0):="0000";r(7 downto 4):=r(7 downto 4)+1;
				end if;
			when others=>null;
			end case;
		end if;	
		q<=r;	 
end process;
end behav;