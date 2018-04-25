require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :user_id => 2
      ),
      Payment.create!(
        :user_id => 2
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
