# frozen_string_literal: true

module People
  class Merge
    def call(order_by, *record_lists)
      order_by = order_by.to_s
      record_lists.flatten.sort { |a, b| a[order_by] <=> b[order_by] }
    end
  end
end
