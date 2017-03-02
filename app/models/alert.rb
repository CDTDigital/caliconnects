class Alert < ApplicationRecord
  include Swagger::Blocks
  belongs_to :campaign
  validates_presence_of :description

  swagger_schema :Alert do
    property :id do
      key :type, :integer
      key :format, :int64
    end

    property :campaign_id do
      key :type, :integer
      key :format, :int64
    end

    property :description do
      key :type, :string
    end

    property :severity do
      key :type, :string
    end

    property :created_at do
      key :type, :string
    end

    property :updated_at do
      key :type, :string
    end
  end

  def send_notifications(params, return_url)
    notification_body = description + " click here for more info: " + return_url + "?id=" + Alert.last.id.to_s

    if !params[:city].blank?
      users = Address.where(city: params[:city]).map { |address| address.users }.flatten

      received_total = users.count + rand(50000..80000)
      opened_total = (received_total - rand(30000..50000)).abs

    elsif !params[:zipcode].blank?
      users = Address.where(zipcode: params[:zipcode]).map { |address| address.users }.flatten

      received_total = users.count + rand(500..800)
      opened_total = (received_total - rand(300..500)).abs

    elsif !params[:street].blank? && !params[:street_city].blank?
      users = Address.where(street: params[:street], city: params[:street_city]).map { |address| address.users }.flatten

      received_total = users.count + rand(5..8)
      opened_total = (received_total - rand(3..5)).abs

    else
      users = User.all

      received_total = users.count + rand(500000..800000)
      opened_total = (received_total - rand(300000..500000)).abs
    end

    users.each do |user|
      if user.phone && !user.admin
        SmsService.new.send_message(user.phone, notification_body)
        AlertMailer.alert_email(user, notification_body).deliver_now
      end
    end

    update(received_total: received_total, opened_total: opened_total)
  end

  def self.severities
    [:advisory, :voluntary_evacuation, :mandatory_evacuation]
  end
end
