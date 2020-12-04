RSpec.describe PassportData do
  it "works" do
    passport_data = PassportData.new("../input_04.txt")

    transform_normalized_passport_data = passport_data.transform_normalized_passport_data
  end
end
