class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
         

  # Setup accessible (or protected) attributes for your model
  
  attr_accessible :email, :password, :password_confirmation, :remember_me 
  # attr_accessible :title, :body
  has_many :ratings

  private

  def guest_user
    puts "in guest user"
   User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
  end

end
