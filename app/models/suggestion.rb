class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle
end
