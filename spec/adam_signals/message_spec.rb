require 'spec_helper'

describe AdamSignals::Message do
  let(:source_type)     { :xmpp }
  let(:source_address)  { 'foo@bar.com' }
  let(:auth_address)    { 'doo@dah.com' }
  let(:body)            { 'Hello there' }
  let(:user)            { { 'profile' => {'name' => 'Ben Langfeld'} } }
  let(:interpretation) do
    <<-JSON
      {
        "msg_id": "ba0fcf60-44d3-4499-877e-c8d65c239730",
        "msg_body": "how many people between Tuesday and Friday?",
        "outcome": {
          "intent": "query_metrics",
          "entities": {
            "metric": {
              "value": "metric_visitors",
              "body": "people"
            },
            "datetime": [
              {
                "value": {
                  "from": "2013-10-21T00:00:00.000Z",
                  "to": "2013-10-22T00:00:00.000Z"
                },
                "body": "Tuesday"
              },
              {
                "value": {
                  "from": "2013-10-24T00:00:00.000Z",
                  "to": "2013-10-25T00:00:00.000Z"
                },
                "body": "Friday"
              }
            ]
          },
          "confidence": 0.979
        }
      }
    JSON
  end

  subject { described_class.new source_type: source_type, source_address: source_address, auth_address: auth_address, body: body, interpretation: interpretation, user: user }

  its(:source_type)     { should == source_type }
  its(:source_address)  { should == source_address }
  its(:auth_address)    { should == auth_address }
  its(:body)            { should == body }
  its(:interpretation)  { should include('msg_id' => "ba0fcf60-44d3-4499-877e-c8d65c239730") }
  its(:user)            { should == { 'profile' => {'name' => 'Ben Langfeld'} } }

  it "should be able to encode to and decode from JSON" do
    subject.should eql(described_class.from_json(subject.to_json))
  end

  describe "equality" do
    context "with no attributes set" do
      it "should be equal" do
        described_class.new.should eql(described_class.new)
      end
    end

    context "with attributes set the same" do
      it "should be equal" do
        described_class.new(source_type: :xmpp).should eql(described_class.new(source_type: :xmpp))
      end
    end

    context "with attributes set differently" do
      it "should be equal" do
        described_class.new(source_type: :email).should_not eql(described_class.new(source_type: :xmpp))
      end
    end
  end
end
