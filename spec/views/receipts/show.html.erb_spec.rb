require 'rails_helper'

RSpec.describe "receipts/show", type: :view do
  before(:each) do
    @receipt = assign(:receipt, Receipt.create!(
      :transaction_number => "Transaction Number",
      :payment_method => "Payment Method",
      :amount => "9.99",
      :tip => "9.99",
      :total => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Transaction Number/)
    expect(rendered).to match(/Payment Method/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
