require File.expand_path('../../../../fluent_bit/config', __FILE__)

module Puppet::Parser::Functions
  # Generates Fluentd configuration from Hash.
  newfunction(:fluent_bit_config, :type => :rvalue) do |args|
    FluentBitConfig.generate(args.first)
  end
end

