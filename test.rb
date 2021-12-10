#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << './lib'
require 'pageview_calculator'

calculator = PageviewCalculator.new('production.log')

p 'A list of web pages with the most page views:'
calculator.list_most_viewed.each { |p| puts p }

p 'A list of most unique page views:'
calculator.list_most_unique.each { |v| puts v }
