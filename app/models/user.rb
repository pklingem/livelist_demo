class User < ActiveRecord::Base
  FILTERS = [:state]
  def self.filters(filter_params)
    filter_params = {} if filter_params.nil?
    FILTERS.map do |filter|
      send("#{filter}_filter", send("#{filter}_filters", filter_params[filter]))
    end
  end

  def self.state_filter_name
    'State'
  end

  def self.state_filter_slug
    'state'
  end

  def self.state_filter(options)
    {
      :filter_slug => state_filter_slug,
      :name => state_filter_name,
      :options => options
    }
  end

  def self.state_filter_options
    select('distinct state').map(&:state)
  end

  def self.state_filter_counts
    group(:state).count
  end

  def self.state_filter_option(state, selected)
    {
      :slug => state,
      :name => state.capitalize,
      :value => state,
      :count => @counts[state],
      :selected => selected
    }
  end

  def self.state_filters(filter_params)
    @counts = state_filter_counts
    state_filter_options.map do |state|
      selected = filter_params.nil? ? true : filter_params.include?(state)
      state_filter_option(state, selected)
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
