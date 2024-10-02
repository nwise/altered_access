# frozen_string_literal: true

RSpec.describe AlteredAccess::Card do
  let(:card_json) { File.read("spec/seeds/card.json") }
  let(:parsed_json) { JSON.parse(card_json) }

  subject { AlteredAccess::Card.new(parsed_json) }

  it "#name" do
    expect(subject.name).to eq("The Kraken")
  end

  it "#context" do
    expect(subject.context).to eq("/contexts/Card")
  end

  it "#all_image_path" do
    expected = JSON.parse('{
      "es-es": "7a5a3dd2979aa50ccd52c265ad749811.jpg",
      "de-de": "0e1a8dcc9f2ee3a10ee41235927ea2c6.jpg",
      "it-it": "f93e3f69a4e8127da5e02416f488abd6.jpg",
      "en-us": "bacee5c49ef861ee2b20751cfecb3c55.jpg",
      "fr-fr": "68092975d0dd6b536adcc21a5ebe4b46.jpg"
    }')
    expect(subject.all_image_path).to eq(expected)
  end

  it "#altered_id" do
    expect(subject.altered_id).to eq("01HKAFJP3CN1N8ZJ8N2HCEV3E1")
  end

  it "#type" do
    expect(subject.type).to eq("Card")
  end

  it "#reference" do
    expect(subject.reference).to eq("ALT_CORE_B_YZ_17_R1")
  end

  it "#image_path" do
    expect(subject.image_path).to eq("https://altered-prod-eu.s3.amazonaws.com/Art/CORE/CARDS/ALT_CORE_B_YZ_17/e4636a3d0ad0ec7f0ad5537ceb6cb9fa.jpg")
  end

  it "#assets" do
    expected = JSON.parse('{
      "WEB": [
      "ALT_CORE_B_YZ_17_U_WEB.jpg"
      ]
    }')
    expect(subject.assets).to eq(expected)
  end

  it "#lower_price" do
    expect(subject.lower_price).to eq(0)
  end

  it "#qr_url_detail" do
    expect(subject.qr_url_detail).to eq("https://qr.altered.gg/ALT_CORE_B_YZ_17_R1")
  end

  it "#main_faction" do
    expected = AlteredAccess::KeyCleaner.clean(parsed_json["mainFaction"])
    expect(Faction).to receive(:new).with(expected)
    binding.pry
    subject.main_faction
  end
end
