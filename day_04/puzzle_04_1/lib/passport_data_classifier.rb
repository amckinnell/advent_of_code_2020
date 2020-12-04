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
    (REQUIRED_FIELDS - passport_data.keys).empty?
  end
end
