 -- Sleep Control Non-User
  constant powerdown_safety_addr                    : std_logic_vector(9 downto 2) := "10111110"; -- 0x2F8
  constant main_clk_safety_addr                     : std_logic_vector(9 downto 2) := "10111111"; -- 0x2FC
  -- Misc Non-user
  constant rom_ws_ctrl_addr                         : std_logic_vector(9 downto 2) := "11100000"; -- 0x380
  constant auto_clk_gate_override_addr              : std_logic_vector(9 downto 2) := "11100001"; -- 0x384
  constant gpio_psync_addr                          : std_logic_vector(9 downto 2) := "11100010"; -- 0x388
  constant fmc_rd_busy_delay_addr                   : std_logic_vector(9 downto 2) := "11100011"; -- 0x38C
  constant main_reg_vout0_cfg_addr                  : std_logic_vector(9 downto 2) := "11100100"; -- 0x390
  constant main_reg_vout1_cfg_addr                  : std_logic_vector(9 downto 2) := "11100101"; -- 0x394
  constant vout_cfg_prot_addr                       : std_logic_vector(9 downto 2) := "11100110"; -- 0x398
  constant refclk_enable_addr                       : std_logic_vector(9 downto 2) := "11100111"; -- 0x39C
  -- Device_cfg Non-user
  constant die_id_addr                              : std_logic_vector(9 downto 2) := "11101100"; -- 0x3B0
  constant ee_size_cfg_addr                         : std_logic_vector(9 downto 2) := "11110110"; -- 0x3D8
  constant rom_size_cfg_addr                        : std_logic_vector(9 downto 2) := "11110111"; -- 0x3DC
  constant flash_size_cfg_addr                      : std_logic_vector(9 downto 2) := "11111000"; -- 0x3E0
  constant config_lockout_addr                      : std_logic_vector(9 downto 2) := "11111001"; -- 0x3E4
  constant sram_size_cfg_addr                       : std_logic_vector(9 downto 2) := "11111010"; -- 0x3E8
  constant peripheral_en_cfg_addr                   : std_logic_vector(9 downto 2) := "11111011"; -- 0x3EC
  constant code_security_prot_addr                  : std_logic_vector(9 downto 2) := "11111100"; -- 0x3F0
  constant jtag_idcode_addr                         : std_logic_vector(9 downto 2) := "11111101"; -- 0x3F4
  constant device_cfg0_addr                         : std_logic_vector(9 downto 2) := "11111110"; -- 0x3F8
  constant device_cfg1_addr                         : std_logic_vector(9 downto 2) := "11111111"; -- 0x3FC
  
  --------------
  
  
          when auto_clk_gate_override_addr     =>
            if (pw_data(31 downto 16) = x"C0DE") then 
              auto_clk_gate_override_i           <= pw_data(15 downto 0);           
            end if;
   