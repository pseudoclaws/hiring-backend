# frozen_string_literal: true

require 'csv'
Dir['./app/services/**/*.rb'].sort.each { |file| require File.expand_path file, __dir__ }
Dir['./app/serializers/**/*.rb'].sort.each { |file| require File.expand_path file, __dir__ }
require './app/people_controller.rb'
