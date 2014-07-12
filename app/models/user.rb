class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

  has_many :microposts, dependent: :destroy

  # Followed users
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  # Followers
  has_many :reverse_relationships, foreign_key: "followed_id", 
                                   dependent: :destroy,
                                   class_name: "Relationship"
  has_many :followers, through: :reverse_relationships, source: :follower


  # This is a method reference. Rails looks for method called create_remember_token
  # and runs it before saving the user
  before_create :create_remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i

	validates :name, presence: true, 
					         length:   { maximum: 50 }
					 
	validates :email, presence:   true, 
					          format:     { with: VALID_EMAIL_REGEX },
					          uniqueness: { case_sensitive: false }

	has_secure_password

	# Presence validations for password and its confirmation automatically
	# added by has_secure_password
	validates :password, length: { minimum: 6 }

  def feed
    # Preliminary
    self.microposts
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def following?(other_user)
    self.relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    self.relationships.find_by(followed_id: other_user.id).destroy
  end

  private 

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
