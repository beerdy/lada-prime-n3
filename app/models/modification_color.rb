class ModificationColor < ActiveRecord::Base
  belongs_to :modification
  belongs_to :color
end
