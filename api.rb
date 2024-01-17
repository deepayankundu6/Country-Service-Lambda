require 'uri'
require 'net/http'

def get_by_name(country_name)
puts "doing a get call for #{country_name}"
country_name = country_name.gsub(" ","%20")
countries_api_domain = ENV['countries_api_domain']
countries_api_version = ENV['countries_api_version']
url = URI("https://#{countries_api_domain}/v#{countries_api_version}/name/#{country_name}")
http = Net::HTTP.new(url,"443")
response = Net::HTTP.get_response(url)
puts "Request response #{response}" if response.is_a?(Net::HTTPSuccess)
response.body
end

def get_by_country_code(country_code)
    puts "doing a get call for #{country_code}"    
    countries_api_domain = ENV['countries_api_domain']
    countries_api_version = ENV['countries_api_version']
    url = URI("https://#{countries_api_domain}/v#{countries_api_version}/alpha/#{country_code}?fullText=true")
    http = Net::HTTP.new(url,"443")
    response = Net::HTTP.get_response(url)
    puts "Request response #{response}" if response.is_a?(Net::HTTPSuccess)
    response.body
end

def get_by_country_language(country_lang)
    puts "doing a get call for #{country_lang}"  
    country_lang = country_lang.gsub(" ","%20") 
    countries_api_domain = ENV['countries_api_domain']
    countries_api_version = ENV['countries_api_version']
    url = URI("https://#{countries_api_domain}/v#{countries_api_version}/lang/#{country_lang}")
    http = Net::HTTP.new(url,"443")
    response = Net::HTTP.get_response(url)
    puts "Request response #{response}" if response.is_a?(Net::HTTPSuccess)
    response.body
end

def get_by_capital_city(country_capital)
    puts "doing a get call for #{country_capital}" 
    country_capital = country_capital.gsub(" ","%20")   
    countries_api_domain = ENV['countries_api_domain']
    countries_api_version = ENV['countries_api_version']
    url = URI("https://#{countries_api_domain}/v#{countries_api_version}/capital/#{country_capital}")
    http = Net::HTTP.new(url,"443")
    response = Net::HTTP.get_response(url)
    puts "Request response #{response}" if response.is_a?(Net::HTTPSuccess)
    response.body
end