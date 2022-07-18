--Testbench Questao 3 EXPERIMENTO 8: sistema de controle de semaforos

--Declaracao da entidade 'vazia':

entity testbench_questao3 is end;

--Declaracao da biblioteca:

LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

--Declaracao da arquitetura:

architecture arquitetura_testbench of testbench_questao3 is

--Declaracao do componente controle, de acordo com sua arquitetura descrita no arquivo controle_semaforos.vhd:

    component controle is

--Declaracao das entradas e saidas do componente controle:

        port(clock : in std_logic;
             ligadesliga : in std_logic;
             sensorA : in std_logic;
             sensorB : in std_logic;
             semaforoA : out std_logic_vector(2 downto 0);
             semaforoB : out std_logic_vector(2 downto 0));

end component;

--Sinais auxiliares:

signal clock_aux : std_logic;
signal ligdes_aux : std_logic;
signal sensorA_aux : std_logic;
signal sensorB_aux : std_logic;

--Direcionamento dos sinais:

begin

    teste_final : controle port map (clock_aux, ligdes_aux, sensorA_aux, sensorB_aux, open, open);
    
--Gerador de clock:

gerador_clock : process
begin

    clock_aux <= '0', '1' after 0.5 ns, '0' after 1 ns;
    wait for 1 ns;
end process gerador_clock;

--Teste das possibilidades:

possibilidades : process
begin

    ligdes_aux <= '1'; sensorA_aux <= '1'; sensorB_aux <= '1';
    wait for 80 ns; sensorB_aux <= '0';
    wait for 50 ns; sensorB_aux <= '1'; sensorA_aux <= '0';
    wait for 30 ns; sensorB_aux <= '0';
    wait for 50 ns; ligdes_aux <= '0';
    wait for 20 ns; ligdes_aux <= '1'; sensorA_aux <= '1'; sensorB_aux <= '1';
    wait for 120 ns;
    wait;
    
end process possibilidades;
end arquitetura_testbench;
