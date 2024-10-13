# frozen_string_literal: true

require "spec_helper"

RSpec.describe Faction do
  let(:parsed_json) { JSON.parse(File.read("spec/seeds/faction.json")) }
  let(:faction) { Faction.new(id: 1, type: "TypeA", reference: "Ref123", color: "Red", name: "FactionName") }

  describe "#initialize" do
    it "creates a Faction with the correct attributes" do
      expect(faction.id).to eq(1)
      expect(faction.type).to eq("TypeA")
      expect(faction.reference).to eq("Ref123")
      expect(faction.color).to eq("Red")
      expect(faction.name).to eq("FactionName")
    end
  end

  describe "attribute accessors" do
    it "allows reading and writing for :id" do
      faction.id = 2
      expect(faction.id).to eq(2)
    end

    it "allows reading and writing for :type" do
      faction.type = "TypeB"
      expect(faction.type).to eq("TypeB")
    end

    it "allows reading and writing for :reference" do
      faction.reference = "Ref456"
      expect(faction.reference).to eq("Ref456")
    end

    it "allows reading and writing for :color" do
      faction.color = "Blue"
      expect(faction.color).to eq("Blue")
    end

    it "allows reading and writing for :name" do
      faction.name = "NewFactionName"
      expect(faction.name).to eq("NewFactionName")
    end
  end
end
