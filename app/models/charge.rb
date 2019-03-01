class Charge < ApplicationRecord
  belongs_to :user

  def receipt
    Receipts::Receipt.new(
      id: id,
      product: "5 Roots Membership",
      company: {
        name: "5 Roots",
        address: "Ciudad de México",
        email: "hello@5roots.co"
      },
      line_items: [
        ["Date", created_at.to_s],
        ["Account Billed", user.email],
        ["Product", "5 Roots Membership"],
        ["Amount", '$' + ActionController::Base.helpers.number_to_currency( amount / 100, :unit => "MXN", :separator => ".", :delimiter => ",")],
        ["Card Charged", "#{card_brand} (**** **** **** #{card_last4})"]
      ]
    )
  end
end

