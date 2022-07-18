--Questao 3 EXPERIMENTO 8: maquina de estado

--Declaracao da biblioteca:

LIBRARY IEEE;
use IEEE.std_logic_1164.all;

--Declaracao da entidade:

entity maquina_estado is
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
end maquina_estado;

--Declaracao da arquitetura:

architecture arquitetura_maquina_estado of maquina_estado is

--Declaracao do tipo 'estado':

type estado is (E0, E1, E2, E3, E4, E5, E6, E7);

--Sinais auxiliares:

signal estado_atual : estado;
signal proximo_estado : estado;

begin

--Processo sequencial:

sequencial : process(clock)

begin

    if rising_edge(clock) then estado_atual <= proximo_estado;
    
end if;
end process sequencial;

--Processo combinacional:

combinacional : process(estado_atual, ligadesliga, sensorA, sensorB, T5, T6, T20, T60)

begin

    case estado_atual is
    
        when E0 => semaforoA <= "010"; semaforoB <= "010"; --Ambos amarelos
            if ligadesliga = '1' then resetcounter <= '1'; proximo_estado <= E2;
            else resetcounter <= '1'; proximo_estado <= E1;
end if;                                                                            --Estes dois estados indicam a alternacia
        when E1 => semaforoA <= "000"; semaforoB <= "000"; --Ambos desligados
            if ligadesliga = '1' then resetcounter <= '1'; proximo_estado <= E2;
            else resetcounter <= '1'; proximo_estado <= E0;
end if;
        when E2 => semaforoA <= "001"; semaforoB <= "100"; --Semaforo A verde e B vermelho
            if ligadesliga = '1' then
                if T60 = '1' or (T20 = '1' and sensorB = '1' and sensorA = '0') then resetcounter <= '1'; proximo_estado <= E3;
                else resetcounter <= '0'; proximo_estado <= E2;
end if;
            else resetcounter <= '1'; proximo_estado <= E0;
end if;
        when E3 => semaforoA <= "010"; semaforoB <= "100"; --Semaforo A amarelo e B vermelho
            if ligadesliga = '1' then
                if T6 = '1' then resetcounter <= '1'; proximo_estado <= E4;
                else resetcounter <= '0'; proximo_estado <= E3;
end if;
            else resetcounter <= '1'; proximo_estado <= E0;
end if;
        when E4 => semaforoA <= "100"; semaforoB <= "100"; --Ambos vermelhos
            if ligadesliga = '1' then
                if T5 = '1' then resetcounter <= '1'; proximo_estado <= E5;
                else resetcounter <= '0'; proximo_estado <= E4;
end if;
            else resetcounter <= '1'; proximo_estado <= E0;
end if;
        when E5 => semaforoA <= "100"; semaforoB <= "001"; --Semaforo A vermelho e B verde
            if ligadesliga = '1' then
                if T60 = '1' or (T20 = '1' and sensorB = '0' and sensorA = '1') then resetcounter <= '1'; proximo_estado <= E6;
                else resetcounter <= '0'; proximo_estado <= E5;
end if;
            else resetcounter <= '1'; proximo_estado <= E0;
end if;
        when E6 => semaforoA <= "100"; semaforoB <= "010"; --Semaforo A vermelho e B amarelo
            if ligadesliga = '1' then
                if T6 = '1' then resetcounter <= '1'; proximo_estado <= E7;
                else resetcounter <= '0'; proximo_estado <= E6;
end if;
            else resetcounter <= '1'; proximo_estado <= E0;
end if;
        when E7 => semaforoA <= "100"; semaforoB <= "100"; --Ambos vermelhos
            if ligadesliga = '1' then
                if T5 = '1' then resetcounter <= '1'; proximo_estado <= E2;
                else resetcounter <= '0'; proximo_estado <= E7;
end if;
            else resetcounter <= '1'; proximo_estado <= E0;
end if;
        when others => semaforoA <= "001"; semaforoB <= "100";
            if ligadesliga = '1' then
                if T60 = '1' or (T20 = '1' and sensorB = '1' and sensorA = '0') then resetcounter <= '1'; proximo_estado <= E3;
                else resetcounter <= '0'; proximo_estado <= E2;
end if;
            else resetcounter <= '1'; proximo_estado <= E0;
end if;
end case;
end process combinacional;
end arquitetura_maquina_estado;
