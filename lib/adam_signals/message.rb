require 'json'
require 'virtus'

class AdamSignals::Message
  include Virtus.value_object

  values do
    attribute :source_type, Symbol
    attribute :source_address, String
    attribute :auth_address, String
    attribute :body, String
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
