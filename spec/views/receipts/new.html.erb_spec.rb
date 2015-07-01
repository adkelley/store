require 'rails_helper'

RSpec.describe "receipts/new", type: :view do
  before(:each) do
    assign(:receipt, Receipt.new(
      :transaction_number => "MyString",
      :payment_method => "MyString",
      :amount => "9.99",
      :tip => "9.99",
      :total => "9.99"
    ))
  end

  it "renders new receipt form" do
    render

    assert_select "form[action=?][method=?]", receipts_path, "post" do

      assert_select "input#receipt_transaction_number[name=?]", "receipt[transaction_number]"

      assert_select "input#receipt_payment_method[name=?]", "receipt[payment_method]"

      assert_select "input#receipt_amount[name=?]", "receipt[amount]"

      assert_select "input#receipt_tip[name=?]", "receipt[tip]"

      assert_select "input#receipt_total[name=?]", "receipt[total]"
    end
  end
end
