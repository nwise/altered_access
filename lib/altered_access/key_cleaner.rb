module AlteredAccess
  class KeyCleaner
    def self.clean(json)
      json.transform_keys do |key|
        key.delete("@").to_sym
      end
    end
  end
end
