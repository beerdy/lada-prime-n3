class ComplectationColor < ActiveRecord::Base
  belongs_to :complectation
  belongs_to :modification
  belongs_to :color
end
