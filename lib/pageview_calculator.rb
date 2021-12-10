# frozen_string_literal: true

# lib/pageview_calculator.rb
class PageviewCalculator
  attr_accessor :log_file_path

  def initialize(file)
    @log_file_path = file
  end

  def list_most_viewed
    # for ruby version 2.7+ (3x faster):
    # histogram = page_views.map { |p| p[0] }.tally
    histogram = page_views.group_by { |p| p[0].itself }.transform_values(&:size)
    sort_histogram(histogram)
  end

  def list_most_unique
    histogram = page_views.group_by(&:shift).transform_values { |v| v.flatten.uniq.size }
    sort_histogram(histogram)
  end

  private

  def page_views
    @page_views ||= File.readlines(log_file_path).map { |l| l.split(' ') }
  end

  def sort_histogram(hist)
    hist.keys.sort_by { |x| [hist[x] * -1, x] }
  end
end
