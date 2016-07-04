require 'rails_helper'

RSpec.describe User, type: :model do
  it "order by first name" do
  	yuri = User.create!(first_name: "Yuri", last_name: "Peregudov",email: "yura@gmail.com", password: "123",country: "Ukraine", city: "Kyiv", age: "21")
  	vasya = User.create!(first_name: "AVasya", last_name: "Peregudov", email: "test@gmail.com", password: "dedw", country: "USA", city: "BOSTON" , age: "31")
  	expect(User.order(:first_name)).to eq([vasya,yuri])
  end



	it "get stat" do
	user = User.new(id: 1, first_name: "Yuri", last_name: "Peregudov",email: "yura@gmail.com", password: "123",country: "Ukraine", city: "Kyiv", age: "21")
	hash = {fullname: "id =1 Yuri Peregudov 21"}
	expect((user.stat)).to eq(hash)
end
end
# "id =#{self.id}             #{self.id}#{self.first_name}+ " " + #{self.last_name}_ + #{self.age}"}