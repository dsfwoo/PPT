class Board < ApplicationRecord

  acts_as_paranoid
  has_many :posts
  validates :title, :intro, presence: true, length: {minimum: 2}
  #It can not be submited, If the column of title is blank.
  # default_scope { where(deleted_at: nil) }

  # def destroy
  #   @board.update(deleted_at: Time.now)
  # end
end