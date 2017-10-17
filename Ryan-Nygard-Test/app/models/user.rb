class User < ApplicationRecord
  has_many :articles
  
  petergate(roles: [:vanilla, :admin, :editor], multiple: false)                                      ##
  
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
