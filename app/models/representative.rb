# frozen_string_literal: true

require 'google/apis/civicinfo_v2'

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''

      # get official's office info
      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end

      # update or create representative
      rep = Representative.find_or_initialize_by(name: official.name)
      rep.title = title_temp
      rep.ocdid = ocdid_temp

      rep = Representative.rep_official_info_assign(rep, official)

      rep.save!
      reps.push(rep)
    end

    reps
  end

  def self.rep_official_info_assign(rep, official)
    # no photo_url provided from Google response
    rep.photo_url = 'https://www.whitehouse.gov/wp-content/uploads/2021/01/P20231115CF-0092.jpg?w=750&h=500&crop=1'
    rep.party = official.party
    unless official.address.nil?
      address_temp = official.address[0]
      rep.street_address = address_temp.line1
      rep.city = address_temp.city
      rep.state = address_temp.state
      rep.zip = address_temp.zip
    end

    rep
  end
end
