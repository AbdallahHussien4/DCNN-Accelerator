LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_tb IS
END test_tb;

ARCHITECTURE sim OF test_tb IS

  CONSTANT clk_hz : INTEGER := 100e6;
  CONSTANT clock_period : TIME := 1 sec / clk_hz;

  SIGNAL clk : STD_LOGIC := '1';
  SIGNAL rst : STD_LOGIC := '1';
  SIGNAL interrupt : STD_LOGIC;
  SIGNAL load_process : STD_LOGIC;
  SIGNAL cnn_image : STD_LOGIC;
  SIGNAL done : STD_LOGIC;
  SIGNAL dout : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL din : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN

  clk <= NOT clk AFTER clock_period;

  DUT : ENTITY work.IO_Unit
    PORT MAP(
      clk => clk,
      rst => rst,
      interrupt => interrupt,
      load_process => load_process,
      cnn_img => cnn_image,
      done => done,
      dout => dout,
      inputSection => din
    );

END ARCHITECTURE;