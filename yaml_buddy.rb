# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # Converts a YAML string into internal data structure @data
  # arguments: yaml - a String in YAML format
  # returns: nothing
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  # Converts @data into a YAML string
  # arguments: none
  # returns: String in YAML format
  def to_yaml
    @data.to_yaml
  end
end
