# frozen_string_literal: true

class SplitAddressIntoComponents < ActiveRecord::Migration[5.2]
  def change
    remove_column :representatives, :address, :string
    add_column :representatives, :city, :string
    add_column :representatives, :street_address, :string
    add_column :representatives, :state, :string
    add_column :representatives, :zip, :string
  end
end
