# frozen_string_literal: true

module AlteredAccess
  # C leans the keys of a JSON object removing the '@' character
  class KeyCleaner
    def self.clean(json)
      json.transform_keys do |key|
        key.delete("@").to_sym
      end
    end
  end
end
