# frozen_string_literal: true

require_relative 'tsv_buddy'
require_relative 'yaml_buddy'

# Converts tabular data between storage formats
class FlipFlap
  include TsvBuddy
  include YamlBuddy

  # Provides read-only access to @data
  attr_reader :data

  # Returns a list of formats that FlipFlap can take as input
  def self.input_formats
    method_names = instance_methods.map(&:to_s)
    outputs = method_names.select { |method| method.start_with?('take_') }
    outputs.map { |method| method[5..] }
  end
end
