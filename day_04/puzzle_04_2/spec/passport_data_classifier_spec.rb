RSpec.describe PassportDataClassifier do
  let(:all_fields) {
    {
      byr: "1937",
      cid: "147",
      ecl: "gry",
      eyr: "2020",
      hcl: "#fffffd",
      hgt: "183cm",
      iyr: "2017",
      pid: "860033327"
    }
  }

  subject(:classifier) { described_class.new }

  it "invalid for passport data with a missing field" do
    passport_data = all_fields.except(:hgt)

    expect(classifier).to_not be_valid(passport_data)
  end

  it "valid for passport data with all fields" do
    passport_data = all_fields

    expect(classifier).to be_valid(passport_data)
  end

  it "valid for passport data with all fields except cid" do
    passport_data = all_fields.except(:cid)

    expect(classifier).to be_valid(passport_data)
  end
end
