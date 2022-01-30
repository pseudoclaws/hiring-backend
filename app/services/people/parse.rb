# frozen_string_literal: true

module People
  class Parse
    CITY_FULL_NAMES = {
      'LA' => 'Los Angeles',
      'NYC' => 'New York City'
    }.freeze

    def call(data, separator)
      csv = CSV.new(data, col_sep: " #{separator} ", headers: true)
      csv.read.map { |row| parse_data_row(row) }
    end

    private

    def parse_data_row(row)
      row.to_h.tap do |r|
        r['city'] = full_city_name(r['city'])
        r['birthdate'] = Date.parse(r['birthdate'])
      end
    end

    def full_city_name(city_name)
      CITY_FULL_NAMES[city_name] || city_name
    end
  end
end
