require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :amount => "9.99",
      :company => "MyString",
      :currency => "MyString"
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input#invoice_amount[name=?]", "invoice[amount]"

      assert_select "input#invoice_company[name=?]", "invoice[company]"

      assert_select "input#invoice_currency[name=?]", "invoice[currency]"
    end
  end
end
