# frozen_string_literal: true

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    normalized_list = process_data.call(**people_params)
    serialize.call(normalized_list)
  end

  private

  attr_reader :params

  def people_params
    params.slice(:order, :dollar_format, :percent_format)
  end

  def process_data
    @process_data ||= People::Normalize.new
  end

  def serialize
    @serialize ||= People::Serialize.new
  end
end
