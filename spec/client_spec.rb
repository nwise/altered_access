# frozen_string_literal: true

require "spec_helper"

RSpec.describe AlteredAccess::Client do
  describe ".adapter" do
    it "returns Faraday" do
      expect(described_class.adapter).to eq(Faraday)
    end
  end

  describe ".get_faction" do
    it "returns a Faction objects" do
      response_body = {
        "@id" => 1,
        "@type" => "Faction",
        "reference" => "YZ",
        color: "purple",
        "name" => "Faction 1"
      }.to_json

      response = instance_double(Faraday::Response, body: response_body)
      allow(Faraday).to receive(:get).and_return(response)
      faction = described_class.get_faction(1)

      expect(faction).to be_a(Faction)
      expect(faction.id).to eq(1)
      expect(faction.type).to eq("Faction")
      expect(faction.reference).to eq("YZ")
      expect(faction.color).to eq("purple")
      expect(faction.name).to eq("Faction 1")
    end
  end

  describe ".factions" do
    it "returns an array of Faction objects" do
      response_body = {
        "hydra:member" => [
          { "@id" => 1, "@type" => "Faction", "reference" => "YZ", color: "purple", "name" => "Faction 1" },
          { "@id" => 2, "@type" => "Faction", "reference" => "YZ", color: "purple", "name" => "Faction 1" }
        ]
      }.to_json
      response = instance_double(Faraday::Response, body: response_body)
      allow(Faraday).to receive(:get).and_return(response)
      factions = described_class.factions

      expect(factions).to all(be_a(Faction))
      expect(factions.map(&:id)).to eq([1, 2])
      expect(factions.map(&:name)).to eq(["Faction 1", "Faction 1"])
    end
  end

  describe ".parse_response" do
    it "parses and cleans the response body" do
      response_body = { "key" => "value" }.to_json
      response = instance_double(Faraday::Response, body: response_body)
      # allow(AlteredAccess::KeyCleaner).to receive(:clean).and_return("cleaned_key" => "value")

      parsed_response = described_class.parse_response(response)
      expect(parsed_response).to eq(key: "value")
    end
  end
end
