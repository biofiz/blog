class Post < ActiveRecord::Base
  validates :user, presence: true
  validates :title,  presence: true, length: { in: 3..250 }
  validates :body,  presence: true, length: { minimum: 50 }
  belongs_to :user
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :categories

  scope :for_user, -> (username) { Post.joins(:user).where('users.username = ?', username) }

  def is_author?(user)
    user_id == user.id
  end

end
