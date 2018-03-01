LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
ENTITY light IS
  PORT(clk,start:IN std_logic;
	   LED:OUT std_logic_vector(2 DOWNTO 0));
END light;
ARCHITECTURE Behav OF light IS
signal i:std_logic_vector(1 DOWNTO 0);
signal c: std_logic;
signal count:integer range 0 to 5000000;
BEGIN

process(clk)
	begin
	if (rising_edge(clk))then
			count<=count+1;
			if count=2500000 then
				c<='1';
			elsif count=5000000 then
				c<='0';
				count<=0;
			end if ;
	end if;
end process;

  PROCESS(c,start)
  BEGIN
	IF(start='0')THEN
		LED<="000";i<="00";
	ELSIF(c'EVENT AND c='1')THEN
		IF(i=2)THEN
			i<="00";
		ELSE
			i<=i+'1';
		END IF;
		CASE i IS
			WHEN "00"=>LED<="110";
			WHEN "01"=>LED<="101";
			WHEN "10"=>LED<="011";
			WHEN others=>LED<="111";
		END CASE;
	END IF;
  END PROCESS;
END Behav;