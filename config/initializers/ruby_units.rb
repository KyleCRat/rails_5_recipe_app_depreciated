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
      lb: 'Pound'
    }
  end

  def pluralize
    separator = RubyUnits.configuration.separator

    # case units
    # when 'fl oz'
    #   "#{scalar.to_f} #{separator} #{units.to_s.pluralize(scalar)}"
    # else
      pluralize_rational(separator)
    # end
  end

  def pluralize_rational(separator)
    unit = ''

    # find the whole unit of the scalar
    whole = (scalar - (scalar % 1)).to_i
    # find the remainer of the scalar
    remainder = (scalar % 1).to_f.to_d.to_r.rationalize(Rational(0.01))

    # insert the whole and remainder if they exist
    unit << whole.to_s unless whole.zero?
    unit << " #{remainder}" unless remainder.zero?

    "#{unit}#{separator}#{units.to_s.pluralize(scalar)}"
  end

  def pluralize_as(unit)
    convert_to(unit).pluralize
  end
end
