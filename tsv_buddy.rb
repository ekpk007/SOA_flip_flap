# frozen_string_literal: true

require 'csv'

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    # Use CSV to parse the TSV data properly and convert to a data structure
    @data = CSV.parse(tsv, col_sep: "\t", headers: true).map(&:to_h)
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    return '' if @data.nil? || @data.empty?

    headers = @data.first.keys.join("\t")

    rows = @data.map { |hash| hash.values.join("\t") }

    "#{headers}\n#{rows.join("\n")}\n"
  end
end
