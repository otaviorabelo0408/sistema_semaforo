--Questao 3 EXPERIMENTO 8: sitema de controle de semaforos

--Declaracao da biblioteca:

LIBRARY IEEE;
use IEEE.std_logic_1164.all;

--Declaracao da entidade:

entity controle is
    port(clock : in std_logic;
         ligadesliga : in std_logic;
         sensorA : in std_logic;
         sensorB : in std_logic;
         semaforoA : out std_logic_vector(2 downto 0);
         semaforoB : out std_logic_vector(2 downto 0));
end controle;

--Declaracao da arquitetura:

architecture arquitetura_controle of controle is

--Declaracao do componente temporizador, de acordo com sua arquitetura descrita no arquivo temporizador.vhd:

    component temporizador is

--Declaracao das entradas e saidas do componente temporizador:

        port(clock : in std_logic;
             reset : in std_logic;
             T5 : out std_logic;
             T6 : out std_logic;
             T20 : out std_logic;
             T60 : out std_logic);
             
end component;

--Declaracao do componente maquina_estado, de acordo com sua arquitetura descrita no arquivo maquina_de_estado.vhd:

    component maquina_estado is

--Declaracao das entradas e saidas do componente temporizador:

        port(clock : in std_logic;
             ligadesliga : in std_logic;
             sensorA : in std_logic;
             sensorB : in std_logic;
             T5 : in std_logic;
             T6 : in std_logic;
             T20 : in std_logic;
             T60 : in std_logic;
             resetcounter : out std_logic;
             semaforoA : out std_logic_vector(2 downto 0);
             semaforoB : out std_logic_vector(2 downto 0));
             
end component;

--Sinais auxiliares:

signal reset_aux : std_logic;
signal T5_aux : std_logic;
signal T6_aux : std_logic;
signal T20_aux : std_logic;
signal T60_aux : std_logic;

--Direcionamento dos sinais:

begin

    temporizador_interno : temporizador port map (clock, reset_aux, T5_aux, T6_aux, T20_aux, T60_aux);
                                                                                                         --Ligacao entre os componentes
    controlador_final : maquina_estado port map (clock, ligadesliga, sensorA, sensorB, T5_aux, T6_aux,
                                                 T20_aux, T60_aux, reset_aux, semaforoA, semaforoB);

end arquitetura_controle;
