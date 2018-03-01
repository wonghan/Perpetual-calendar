LIBRARY IEEE ;
USE IEEE.std_logic_1164.all ;
USE IEEE.std_logic_unsigned.all ;
ENTITY key_read IS 
PORT (clk : IN std_logic ;
sw :IN std_logic ;
low_sw_an:out std_logic);
END ENTITY ;
ARCHITECTURE behav OF key_read IS
SIGNAL key_rst : std_logic ;
SIGNAL key_rst_an : std_logic ;
SIGNAL key_rst_r :std_logic ;
SIGNAL low_sw : std_logic ;
SIGNAL low_sw_r :std_logic ;
SIGNAL cnt : std_logic_vector (19 downto 0) ;
BEGIN
PROCESS (clk)
BEGIN
IF  clk'event and clk = '1'  THEN
key_rst <= sw;
END IF ;
END PROCESS ;
PROCESS (clk)
BEGIN
IF clk'event and clk = '1' THEN
key_rst_r <= key_rst ; 
END IF ;
END PROCESS ;
key_rst_an <= key_rst_r AND NOT key_rst ; 
PROCESS (clk )
BEGIN
IF clk'event and clk = '1' THEN 
IF key_rst_an = '0' 
THEN cnt <= cnt + '1' ;
 ELSE cnt <= (OTHERS => '0') ; 
 END IF ;
END IF ;
END PROCESS ;
PROCESS (clk)
BEGIN
IF clk'event and clk = '1' THEN
IF cnt = "11111111111111111111" THEN 
low_sw <= sw; 
ELSE NULL ;
 END IF ;
END IF ;
END PROCESS ;
PROCESS (clk )
BEGIN
IF clk'event and clk = '1' THEN
low_sw_r <= low_sw ;
END IF ;
END PROCESS ;
low_sw_an <= low_sw_r AND NOT low_sw ; 
END behav;