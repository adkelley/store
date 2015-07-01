require 'rails_helper'

RSpec.describe "receipts/index", type: :view do
  before(:each) do
    assign(:receipts, [
      Receipt.create!(
        :transaction_number => "Transaction Number",
        :payment_method => "Payment Method",
        :amount => "9.99",
        :tip => "9.99",
        :total => "9.99"
      ),
      Receipt.create!(
        :transaction_number => "Transaction Number",
        :payment_method => "Payment Method",
        :amount => "9.99",
        :tip => "9.99",
        :total => "9.99"
      )
    ])
  end

  it "renders a list of receipts" do
    render
    assert_select "tr>td", :text => "Transaction Number".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Method".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
