require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :amount => "9.99",
      :company => "MyString",
      :currency => "MyString"
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input#invoice_amount[name=?]", "invoice[amount]"

      assert_select "input#invoice_company[name=?]", "invoice[company]"

      assert_select "input#invoice_currency[name=?]", "invoice[currency]"
    end
  end
end
