# frozen_string_literal: true

class Faction
  attr_accessor :id, :type, :reference, :color, :name

  def initialize(id:, type:, reference:, color:, name:)
    @id = id
    @type = type
    @reference = reference
    @color = color
    @name = name
  end
end
