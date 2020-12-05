#
# Knows if the specified Password Data is valid.
#
class PassportDataClassifier
  REQUIRED_FIELDS = [
    :byr,
    :ecl,
    :eyr,
    :hcl,
    :hgt,
    :iyr,
    :pid
  ]

  OPTIONAL_FIELDS = [
    :cid
  ]

  def valid?(passport_data)
    return false if (REQUIRED_FIELDS - passport_data.keys).any?

    passport_data.all? { |k, v| send("valid_#{k}?", v) }
  end

  private

  def valid_byr?(value)
    in_range? value, (1920..2002)
  end

  def valid_cid?(_value)
    true
  end

  def valid_ecl?(value)
    value.length == 3 && %w[amb blu brn gry grn hzl oth].include?(value)
  end

  def valid_eyr?(value)
    in_range? value, (2020..2030)
  end

  def valid_hcl?(value)
    /^#[0-9a-f]{6}$/.match? value
  end

  def valid_hgt?(value)
    height, uom = /^(\d+)(cm|in)$/.match(value)&.captures || [-1, "invalid"]

    case uom
    when "cm"
      in_range? height, (150..193)
    when "in"
      in_range? height, (59..76)
    else
      false
    end
  end

  def valid_iyr?(value)
    in_range? value, (2010..2020)
  end

  def valid_pid?(value)
    /^[0-9]{9}$/.match? value
  end

  def in_range?(value, range)
    /\d+/.match?(value) && range.include?(value.to_i)
  end
end
