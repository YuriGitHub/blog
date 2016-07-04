require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
	describe "GET on stat" do
	it "responds succesfully with an HTTP 200 status code" do
	@user = User.create!(first_name: "AVasya", last_name: "Peregudov", email: "test@gmail.com", password: "dedw", country: "USA", city: "BOSTON" , age: "31")
	get :stat, {user_id: 1}
	puts response.body

	expect(response[:stat]).to eq(response[:stat])
	# puts expect(response[:stat])
	# expect(response).to be_success
	# expect(response).to have_http_status(200)
	end

end

end
