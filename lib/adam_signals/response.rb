require 'json'
require 'virtus'

class AdamSignals::Response
  include Virtus::ValueObject

  attribute :target_type, Symbol
  attribute :target_address, String
  attribute :body, String

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
