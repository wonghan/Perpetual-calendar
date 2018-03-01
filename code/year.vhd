Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity year is 
Port(clk,reset,uph:in std_logic;
    qh:out std_logic_vector(7 downto 0);	
	ql:out std_logic_vector(7 downto 0);
	run:out std_logic);
end entity;
architecture behav of year is
begin
process(clk,reset)
variable r:std_logic_vector(15 downto 0); 
variable a:integer range 1 to 4;
variable b:integer range 1 to 100;
variable c:integer range 1 to 400;
begin
		if reset='0' then r:="0010000000000000";
		elsif (rising_edge(clk)) then
			a:=a+1;b:=b+1;c:=c+1;run<='0';
			if uph='1'then r(11 downto 8):=r(11 downto 8)+1;
				if r(11 downto 8)="1010" then
					r(11 downto 8):="0000";
					r(15 downto 12):=r(15 downto 12)+1;
				end if;
			else r:=r+1;
			end if;
			if a=4 then run<='1';a:=1;
			end if;
			if b=100 then run<='0';b:=1;
			end if;
			if c=100 then run<='1';c:=1;
			end if;
			if r(3 downto 0)="1010"  then
				r(3 downto 0):="0000";
				r(7 downto 4):=r(7 downto 4)+1;
				if r(7 downto 4)="1010" then
					r(7 downto 4):="0000";
					r(15 downto 8):=r(15 downto 8)+1;
					if r(11 downto 8)="1010" then
						r(11 downto 8):="0000";
						r(15 downto 12):=r(15 downto 12)+1;
					end if;
				end if;
			end if;
			if r=9999 then
				r:="0000000000000000";
			end if;
			
		end if;	
		qh<=r(15 downto 8);
		ql<=r(7 downto 0);	 
end process;
end behav;