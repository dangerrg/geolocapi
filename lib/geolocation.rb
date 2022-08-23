# frozen_string_literal: true
module Geolocation
  require 'net/http'
  require 'net/https'

  @base_url   = ENV.fetch('IP_PROVIDER_BASE_URL')
  @check_ip   = ENV.fetch('IP_PROVIDER_CHECK_IP')
  @access_key = ENV.fetch('IP_PROVIDER_ACCESS_KEY')
  @fields     = ENV.fetch('IP_PROVIDER_FIELDS')

  def self.getiplocation(check_ip)
    uri = URI(@base_url + @check_ip + '?access_key=' + @access_key + '&fields=' + @fields)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(uri)

    response = http.request(request)

    response.body
  rescue StandardError => e
    puts "Error (#{e.message})"
  end

  pp JSON.parse(getiplocation("132.191.24.83"))
end
