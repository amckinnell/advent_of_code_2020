require_relative "../configure_zeitwerk"

passport_data = PassportData.new("../input_04.txt")
passport_data_classifier = PassportDataClassifier.new

pp passport_data.transform_normalized_passport_data.count { |d| passport_data_classifier.valid?(d) }
