--Questao 1 EXPERIMENTO 8: contador modulo 10

--Declaracao de biblioteca:

LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Declaracao de entidade:

entity contador_10 is
    port(clock : in std_logic;
         reset : in std_logic;
         enable : in std_logic;
         rci : in std_logic;
         load : in std_logic;
         D : in std_logic_vector(3 downto 0);
         Q : out std_logic_vector(3 downto 0);
         rco : out std_logic);
end contador_10;

--Declaracao de arquitetura:

architecture arquitetura_contador_10 of contador_10 is

--Declaracao do tipo estado:

type estado is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8, ST9);

--Sinais auxiliares:

signal estado_atual : estado;
signal proximo_estado : estado;
signal load_estado : estado;

--Atribuicao do load_state:

begin

    with D select
        load_estado <= ST0 when "0000",
        ST1 when "0001",
        ST2 when "0010",
        ST3 when "0011",
        ST4 when "0100",
        ST5 when "0101",
        ST6 when "0110",
        ST7 when "0111",
        ST8 when "1000",
        ST9 when "1001",
        ST0 when others;

--Processo sequencial:

sequencial : process(clock)
begin
    if rising_edge(clock) then
        estado_atual <= proximo_estado;
    end if;
end process sequencial;

--Processo combinacional:

combinacional : process(estado_atual, reset, enable, rci, load, load_estado)
begin
    case estado_atual is
        when ST0 => Q <= "0000"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST1;
            else proximo_estado <= ST0;
end if;
        when ST1 => Q <= "0001"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST2;
            else proximo_estado <= ST1;
end if;
        when ST2 => Q <= "0010"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST3;
            else proximo_estado <= ST2;
end if;
        when ST3 => Q <= "0011"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST4;
            else proximo_estado <= ST3;
end if;
        when ST4 => Q <= "0100"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST5;
            else proximo_estado <= ST4;
end if;
        when ST5 => Q <= "0101"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST6;
            else proximo_estado <= ST5;
end if;
        when ST6 => Q <= "0110"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST7;
            else proximo_estado <= ST6;
end if;
        when ST7 => Q <= "0111"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST8;
            else proximo_estado <= ST7;
end if;
        when ST8 => Q <= "1000"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST9;
            else proximo_estado <= ST8;
end if;
        when ST9 => Q <= "1001"; rco <= '0';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST0;
            else proximo_estado <= ST9;
end if;
        when others => Q <= "0000"; rco <= '1';
            if reset = '1' then proximo_estado <= ST0;
            elsif load = '1' then proximo_estado <= load_estado;
            elsif enable = '0' and rci = '0' then proximo_estado <= ST1;
            else proximo_estado <= ST0;
end if;
end case;
end process combinacional;
end arquitetura_contador_10;
