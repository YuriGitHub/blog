class User < ActiveRecord::Base

  
  validates :first_name, :last_name, :email, :password, presence: true
  validates :first_name, :last_name, :email, :country, :city, :password, :length => {maximum: 30, minimum: 2}
  validates_inclusion_of :age, :in => 16..150

  has_many :posts
  has_many :comments


  def stat 
  	
  	unless self.age.nil?
  	{fullname: "id =#{self.id} #{self.first_name} #{self.last_name} #{self.age}"}
  else
		{fullname: "id = #{self.id}            #{self.first_name}+ " " + #{self.last_name}"}
end

end

end
