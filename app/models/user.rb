class User < ActiveRecord::Base
  filter_for :status
  filter_for :state, :reference_criteria => ['Virginia', 'South Carolina', 'Colorado', 'California']
end
