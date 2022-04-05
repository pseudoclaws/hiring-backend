# frozen_string_literal: true

module People
  class Serialize
    DEFAULT_DATE_FORMAT = '%-m/%-d/%Y'

    def call(people_records, date_format = DEFAULT_DATE_FORMAT)
      people_records.map do |record|
        record.transform_values! { |value| format_value(value, date_format) }
        record.values.join(', ')
      end
    end

    private

    def format_value(value, date_format)
      value.is_a?(Date) ? value.strftime(date_format) : value
    end
  end
end
