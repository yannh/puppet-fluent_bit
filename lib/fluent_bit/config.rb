# Generates Fluent-bit configuration from a Hash.
#
# @note This file must be compatible with Ruby 1.8.7 in order to work on EL6.

module FluentBitConfig
  class << self
    # Generates Fluent-bit configuration from a Hash.
    #
    # @param config [Hash] the configuration
    # @return [String] the Fluentd configuration
    def generate(config)
      config.map { |_, c| render(c) }.join
    end

    private

    def render(c)
      "[#{c["service"]}.upcase]\n" + \
      c.select{ |e| e !="service" }
       .map { |k, v|
          key = k.strip.downcase
          value = v.strip.downcase
          padding = 15 - key.length
          padding = padding < 1 ? 1 : padding
          "  " << key << " "*padding <<  value}
       .join("\n")
       .concat("\n")
    end
  end
end
