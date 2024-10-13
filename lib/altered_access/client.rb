# frozen_string_literal: true

module AlteredAccess
  # Represents the HTTP client for the Altered Access API
  class Client
    class << self
      def adapter
        Faraday
      end

      def get_card(id)
        response = Faraday.get("https://api.altered.gg/cards/#{id}")
        Card.new(response.parsed_response)
      end

      def get_faction(id)
        response = Faraday.get("https://api.altered.gg/factions/#{id}")
        parsed_body = parse_response(response)
        Faction.new(**parsed_body)
      end

      def factions
        response = Faraday.get("https://api.altered.gg/factions")
        parse_response(response)[:"hydra:member"].map do |json|
          faction = KeyCleaner.clean(json)
          Faction.new(**faction)
        end
      end

      def parse_response(response)
        parsed_body = JSON.parse(response.body)
        KeyCleaner.clean(parsed_body)
      end
    end
  end
end
