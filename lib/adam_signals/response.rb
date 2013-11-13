require 'json'
require 'virtus'

class AdamSignals::Response
  include Virtus.value_object

  values do
    attribute :target_type, Symbol
    attribute :target_address, String
    attribute :body, String
    attribute :action, String, default: 'translate'
  end

  def self.from_json(json)
    new JSON.parse(json)
  end

  def to_json
    JSON.generate attributes
  end

  def to_s
    "#<#{self.class.name} #{attributes}>"
  end
end
