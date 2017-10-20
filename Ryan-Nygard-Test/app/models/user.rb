class User < ApplicationRecord
  has_many :articles
  
  petergate(roles: [:admin, :editor], multiple: true)                                      ##
  
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
