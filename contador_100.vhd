--Questao 1 EXPERIMENTO 8: contador modulo 100 a partir
--do cascateamento de dois contadores modulo 10

--Declaracao da biblioteca:

LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity contador_100 is
    port(clock : in std_logic;
         reset : in std_logic;
         enable : in std_logic;
         load : in std_logic;
         dezload : in std_logic_vector(3 downto 0);
         uniload : in std_logic_vector(3 downto 0);
         dezena : out std_logic_vector(3 downto 0);
         unidade : out std_logic_vector(3 downto 0));
end contador_100;

architecture arquitetura_contador_100 of contador_100 is

--Declaracao do componente contador_10, de acordo com sua arquitetura descrita no arquivo contador_10.vhd:

    component contador_10 is

--Declaracao das entradas e saidas do componente contador_10:

        port(clock : in std_logic;
             reset : in std_logic;
             enable : in std_logic;
             rci : in std_logic;
             load : in std_logic;
             D : in std_logic_vector(3 downto 0);
             Q : out std_logic_vector(3 downto 0);
             rco : out std_logic);

end component;

--Sinais auxiliares:

signal rco1_aux : std_logic;

--Atribuicao das entradas e saidas e cascateamento dos contadores modulo 10:

begin

    contador1 : contador_10 port map (clock, reset, enable, '0', load, uniload, unidade, rco1_aux);
    contador2 : contador_10 port map (clock, reset, enable, rco1_aux, load, dezload, dezena, open);

end arquitetura_contador_100;
