Unit.redefine!('cup') do |cup|
  cup.display_name = 'Cup'
end

Unit.redefine!('tablespoon') do |tablespoon|
  tablespoon.display_name = 'Tbsp'
end

Unit.redefine!('teaspoon') do |teaspoon|
  teaspoon.display_name = 'tsp'
end

Unit.redefine!('fluid-ounce') do |floz|
  floz.display_name = 'fl oz'
end


class Unit
  def self.measurements
    {
      # Volume
      cup: 'Cup',
      floz: 'Fluid Ounce',
      tbsp: 'Tablespoon',
      tsp: 'Teaspoon',
      # Weight
      lb: "Pound"
    }
  end

  def pluralize
    separator = RubyUnits.configuration.separator

    case self.units
    when 'fl oz'
      "#{self.scalar.to_f}#{separator}#{self.units.to_s.pluralize(self.scalar)}"
    else
      case self.scalar
      when Complex
        "#{self.scalar}#{separator}#{self.units.to_s.pluralize(self.scalar)}"
      when Rational
        # Why moduloing by 1?
        unit = "#{(self.scalar - (self.scalar % 1)).to_i} #{self.scalar % 1}"
        "#{unit}#{separator}#{self.units.to_s.pluralize(self.scalar)}"
      else
        "#{self.scalar}#{separator}#{self.units.to_s.pluralize(self.scalar)}"
      end
    end
  end

  def pluralize_as(unit)
    self.convert_to(unit).pluralize
  end
end
