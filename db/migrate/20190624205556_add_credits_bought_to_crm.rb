class AddCreditsBoughtToCrm < ActiveRecord::Migration[5.2]
  def change
  	add_column :crms, :buy_credits, :float
  end
end
