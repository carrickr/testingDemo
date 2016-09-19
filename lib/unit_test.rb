
# I am a module written for teaching purposes.  I really don't have anything worthy of TLD but carrickr wrote it anyway so Rubocop would get off his case.
# @since 0.0.1
module UnitTest
  # When passed a valid string of hex characters this function will convert the string from hex.
  # @param [String] hex_string the string to convert from hex
  # @raise [ArgumentError] raised if hex_string contains non hex characters
  # @return [String] ascii of whatever the hex_string converts to
  def from_hex(hex_string)
    raise ArgumentError, "string #{hex_string} contains non hex characters" if hex_string[/\H/]
    [hex_string].pack('H*')
  end

  # When passed a string of hex characters this function converts it to ascii or vice versa
  # @param [String] convertee The string to be converted
  # @return [String] the converted string
  def hex_ascii_swapper(convertee)
    result = from_hex(convertee) unless convertee[/\H/]
    result = to_hex(convertee) if convertee[/\H/]
    result
  end

  # Takes a string containing ascii and converts it to hex
  # @param [String] ascii_string The string to be converted to hex
  # @raise [ArgumentError] raised if not passed a string
  # @return [String] a hex of the ascii_string
  def to_hex(ascii_string)
    raise ArgumentError, "string #{ascii_string} contains non ascii characters" if (ascii_string =~ /\p{ASCII}/) > 0
    ascii_string.unpack('H*')
  end

end
