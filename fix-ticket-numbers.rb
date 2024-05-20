data = [
    "[[LEPHUCR-015]]",
    "[[LEPHUCR-013]]",
    "[[LEPHUCR-014]]",
    "[[LEPHUCR-023]]",
    "[[LEPHUCR-026]]",
    "[[LEPHUCR-020]]",
    "[[LEPHUCR-006]]",
    "[[LEPHUCR-002]]",
    "[[LEPHUCR-010]]",
    "[[LEPHUCR-007]]",
    "[[LEPHUCR-025]]",
    "[[LEPHUCR-019]]",
    "[[LEPHUCR-011]]",
    "[[LEPHUCR-008]]",
    "[[LEPHUCR-028]]",
    "[[LEPHUCR-027]]",
    "[[LEPHUCR-001]]",
    "[[LEPHUCR-017]]",
    "[[LEPHUCR-005]]",
    "[[LEPHUCR-012]]",
    "[[LEPHUCR-004]]",
    "[[LEPHUCR-003]]",
]

# Extract the numbers from the data and sort them
numbers = data.map { |item| item.scan(/\d+/).first.to_i }.sort

# Create a mapping from old numbers to new numbers
mapping = numbers.each_with_index.to_h { |old, index| [old, index + 1] }

# Apply the mapping to the data
new_data = data.map do |item|
  old_number = item.scan(/\d+/).first.to_i
  new_number = mapping[old_number]
  item.gsub(/\d+/, new_number.to_s.rjust(3, '0'))
end

new_data.each { |item| puts item }