--Questao 2 EXPERIMENTO 8: timeflags

--Declaracao da biblioteca:

LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Declaracao da entidade:

entity timeflags is
    port(cont_dezena : in std_logic_vector(3 downto 0);
         cont_unidade : in std_logic_vector(3 downto 0);
         T5 : out std_logic;
         T6: out std_logic;
         T20 : out std_logic;
         T60 : out std_logic);
end timeflags;

--Declaracao da arquitetura:

architecture arquitetura_timeflags of timeflags is

--Sinal auxiliar:

signal DU : std_logic_vector(7 downto 0);

--Direcionamento do sinal:

begin

    DU <= std_logic_vector((unsigned(cont_dezena) * 10) + unsigned(cont_unidade));

T5 <= '1' when DU >= "00000101" else '0';
T6 <= '1' when DU >= "00000110" else '0';
T20 <= '1' when DU >= "00010100" else '0';
T60 <= '1' when DU >= "00111100" else '0';

end arquitetura_timeflags;
