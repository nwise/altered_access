# frozen_string_literal: true

module AlteredAccess
  # Represents a card in a deck
  class Card
    attr_accessor :context, :altered_id, :type, :reference, :lore_entries, :card_type, :card_sub_types, :card_set, :rarity,
                  :card_rulings, :image_path, :assets, :lower_price, :qr_url_detail, :main_faction, :all_image_path, :name, :elements

    def initialize(json_data)
      json = clean_keys(json_data)
      @all_image_path = json[:allImagePath]
      @name = json[:name]
      @context = json[:context]
      @altered_id = json[:id]
      @type = json[:type]
      @reference = json[:reference]
      @image_path = json[:imagePath]
      @assets = json[:assets]
      @lower_price = json[:lowerPrice]
      @qr_url_detail = json[:qrUrlDetail]
      @main_faction = Faction.new(
        **clean_keys(json[:mainFaction])
      )

      # @lore_entries = json[:loreEntries].map { |entry| LoreEntry.new(entry) }
      # @card_type = CardType.new(json[:cardType])
      # @card_sub_types = json[:cardSubTypes].map { |sub_type| CardSubType.new(sub_type) }
      # @card_set = CardSet.new(json[:cardSet])
      # @rarity = Rarity.new(json[:rarity])
      # @card_rulings = json[:cardRulings].map { |ruling| CardRuling.new(ruling) }
      # @elements = Elements.new(json[:elements])
    end

    private

    def clean_keys(json)
      KeyCleaner.clean(json)
    end
  end
end
