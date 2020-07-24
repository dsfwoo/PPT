class Board < ApplicationRecord

  validates :title, :intro, presence: true, length: {minimum: 2}
  #It can not be submited, If the column of title is blank.
end
