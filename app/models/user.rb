class User < ActiveRecord::Base
  filter_for :status
  filter_for :state, :collection => ['Virginia', 'South Carolina', 'Colorado', 'California']
end
