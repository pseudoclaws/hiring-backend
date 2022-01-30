# frozen_string_literal: true

module People
  class Normalize
    NORMALIZED_FIELDS = %w[first_name city birthdate].freeze

    def initialize(merge_lists: People::Merge.new, parse: People::Parse.new)
      @merge_lists = merge_lists
      @parse = parse
    end

    def call(dollar_format:, percent_format:, order:)
      by_dollar_list = parse.call(dollar_format, '$')
      by_percent_list = parse.call(percent_format, '%')
      merged_records = merge_lists.call(order, by_dollar_list, by_percent_list)
      merged_records.map { |record| record.slice(*NORMALIZED_FIELDS) }
    end

    private

    attr_reader :merge_lists, :parse
  end
end
