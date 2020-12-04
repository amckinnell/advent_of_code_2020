#
# Knows how to parse the Password Data input file
#

class PassportData
  def initialize(filename)
    @filename = filename
  end

  def transform_normalized_passport_data
    normalized_passport_data.map do |passport_data|
      passport_data.split.map { |d| d.split(":") }.to_h.transform_keys(&:to_sym)
    end
  end

  private

  def normalized_passport_data
    raw_passport_data.each_with_object([""]) do |line, memo|
      if line.empty?
        memo << ""
      else
        memo.last << " #{line}"
      end
    end
  end

  def raw_passport_data
    @_raw_passport_data ||= File.foreach(@filename).map { |line| line.chomp }
  end
end
