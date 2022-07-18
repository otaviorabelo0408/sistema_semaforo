--Questao 2 EXPERIMENTO 8: temporizador

--Declaracao da biblioteca:

LIBRARY IEEE;
use IEEE.std_logic_1164.all;

--Declaracao da entidade:

entity temporizador is
    port(clock : in std_logic;
         reset : in std_logic;
         T5 : out std_logic;
         T6 : out std_logic;
         T20 : out std_logic;
         T60 : out std_logic);
end temporizador;

--Declaracao de arquitetura:

architecture arquitetura_temporizador of temporizador is

--Declaracao do componente contador_100, de acordo com sua arquitetura descrita no arquivo contador_100.vhd:

    component contador_100 is

--Declaracao das entradas e saidas do componente contador_100:

        port(clock : in std_logic;
             reset : in std_logic;
             enable : in std_logic;
             load : in std_logic;
             dezload : in std_logic_vector(3 downto 0);
             uniload : in std_logic_vector(3 downto 0);
             dezena : out std_logic_vector(3 downto 0);
             unidade : out std_logic_vector(3 downto 0));
             
end component;

--Declaracao do componente timeflags, de acordo com sua arquitetura descrita no arquivo timeflags.vhd:

    component timeflags is

--Declaracao das entradas e saidas do componente timeflags:

        port(cont_dezena : in std_logic_vector(3 downto 0);
             cont_unidade : in std_logic_vector(3 downto 0);
             T5 : out std_logic;
             T6: out std_logic;
             T20 : out std_logic;
             T60 : out std_logic);

end component;

--Sinais auxiliares:

signal dezena_aux : std_logic_vector(3 downto 0);
signal unidade_aux : std_logic_vector(3 downto 0);

--Direcionamento das entradas, saidas, e dos sinais auxiliares:

begin

    processo_contador : contador_100 port map (clock, reset, '0', '0', "0000", "0000", dezena_aux, unidade_aux);

    processo_timeflags : timeflags port map (dezena_aux, unidade_aux, T5, T6, T20, T60);

end arquitetura_temporizador;
