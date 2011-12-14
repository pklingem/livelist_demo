class User < ActiveRecord::Base
  def self.filters(filter_params)
    filter_params = {} if filter_params.nil?
    [
      { :filter_slug => 'state', :name => 'State', :options => state_filters(filter_params[:state]) }
    ]
  end

  def self.state_filter_options
    select('distinct state').map(&:state)
  end

  def self.state_filter_counts
    group(:state).count
  end

  def self.state_filters(filter_params)
    counts = state_filter_counts
    state_filter_options.map do |state|
      {
        :slug => state,
        :name => state.capitalize,
        :value => state,
        :count => counts[state],
        :selected => filter_params.nil? ? true : filter_params.include?(state)
      }
    end
  end

  def self.filter(filter_params)
    filter_params = {} if filter_params.nil?
    query = scoped
    filter_params.each do |filter, values|
      query = query.where(filter => values)
    end
    query
  end
end
