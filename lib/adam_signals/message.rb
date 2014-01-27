require 'json'
require 'virtus'

class Json < Virtus::Attribute
  def coerce(value)
    return unless value
    value.is_a?(::Hash) ? value : JSON.parse(value)
  end
end

class AdamSignals::Message
  include Virtus.value_object

  values do
    attribute :source_type, Symbol
    attribute :source_address, String
    attribute :auth_address, String
    attribute :body, String
    attribute :interpretation, Json
    attribute :user, Hash
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
