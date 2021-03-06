# Ta-Lib function mapping class 
# Function: 'BBANDS'
# Description: 'Bollinger Bands'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::Bbands < Indicator::Base
  # Time Period <Integer>
  attr_accessor :time_period
  # Deviations up <Double>
  attr_accessor :deviations_up
  # Deviations down <Double>
  attr_accessor :deviations_down
  # MA Type <MA Type>
  attr_accessor :ma_type

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @time_period = h[:time_period] || 5
      @deviations_up = h[:deviations_up] || 2.000000e+0
      @deviations_down = h[:deviations_down] || 2.000000e+0
      @ma_type = h[:ma_type] || 0
    else
      @time_period = args[0] || 5 
      @deviations_up = args[1] || 2.000000e+0 
      @deviations_down = args[2] || 2.000000e+0 
      @ma_type = args[3] || 0 
    end
    
    @func = TaLib::Function.new("BBANDS")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :time_period, :deviations_up, :deviations_down, :ma_type ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_real_upper_band, :out_real_middle_band, :out_real_lower_band ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))

    @func.opt_int(0, @time_period)
    @func.opt_real(1, @deviations_up)
    @func.opt_real(2, @deviations_down)
    @func.opt_int(3, @ma_type)

    out_real_upper_band = Array.new(len)
    @func.out_real(0, out_real_upper_band)
    out_real_middle_band = Array.new(len)
    @func.out_real(1, out_real_middle_band)
    out_real_lower_band = Array.new(len)
    @func.out_real(2, out_real_lower_band)
  
    @func.call(0, len - 1)

  {:out_real_upper_band => out_real_upper_band,
    :out_real_middle_band => out_real_middle_band,
    :out_real_lower_band => out_real_lower_band}
  end
end
