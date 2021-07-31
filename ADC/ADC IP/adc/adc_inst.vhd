	component adc is
		port (
			CLOCK    : in  std_logic                     := 'X'; -- clk
			RESET    : in  std_logic                     := 'X'; -- reset
			CH0      : out std_logic_vector(11 downto 0);        -- CH0
			CH1      : out std_logic_vector(11 downto 0);        -- CH1
			CH2      : out std_logic_vector(11 downto 0);        -- CH2
			CH3      : out std_logic_vector(11 downto 0);        -- CH3
			CH4      : out std_logic_vector(11 downto 0);        -- CH4
			CH5      : out std_logic_vector(11 downto 0);        -- CH5
			CH6      : out std_logic_vector(11 downto 0);        -- CH6
			CH7      : out std_logic_vector(11 downto 0);        -- CH7
			ADC_SCLK : out std_logic;                            -- SCLK
			ADC_CS_N : out std_logic;                            -- CS_N
			ADC_DOUT : in  std_logic                     := 'X'; -- DOUT
			ADC_DIN  : out std_logic                             -- DIN
		);
	end component adc;

	u0 : component adc
		port map (
			CLOCK    => CONNECTED_TO_CLOCK,    --                clk.clk
			RESET    => CONNECTED_TO_RESET,    --              reset.reset
			CH0      => CONNECTED_TO_CH0,      --           readings.CH0
			CH1      => CONNECTED_TO_CH1,      --                   .CH1
			CH2      => CONNECTED_TO_CH2,      --                   .CH2
			CH3      => CONNECTED_TO_CH3,      --                   .CH3
			CH4      => CONNECTED_TO_CH4,      --                   .CH4
			CH5      => CONNECTED_TO_CH5,      --                   .CH5
			CH6      => CONNECTED_TO_CH6,      --                   .CH6
			CH7      => CONNECTED_TO_CH7,      --                   .CH7
			ADC_SCLK => CONNECTED_TO_ADC_SCLK, -- external_interface.SCLK
			ADC_CS_N => CONNECTED_TO_ADC_CS_N, --                   .CS_N
			ADC_DOUT => CONNECTED_TO_ADC_DOUT, --                   .DOUT
			ADC_DIN  => CONNECTED_TO_ADC_DIN   --                   .DIN
		);

