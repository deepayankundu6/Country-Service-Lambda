require 'json'
require './api'
require './constants'

def my_service(event:, context:)
  begin 
    payload = JSON.parse( event['body'] )
    search_Term = payload["search_Term"]
    search_Method = payload["Search_Method"]
    puts "Fetching data using #{search_Method} for #{search_Term}"
    api_response = ''

    raise "Please provide the country Identity" if !search_Term || search_Term.length == 0
    raise "Please provide the search menthod" if !search_Method || search_Method.length == 0

    case search_Method
      when NAME
        api_response = get_by_name(search_Term)

      when CAPITAL
        api_response = get_by_capital_city(search_Term)

      when CODE
        api_response = get_by_country_code(search_Term)

      when LANGUAGE
        api_response = get_by_country_language(search_Term)

      else
        raise "Unknown method provided"

    end

    {
      statusCode: 200,
      body: {
        message: 'Lambda executed Successfully',
        items: JSON.parse(api_response)
      }.to_json
    }

  rescue => error

  {
    statusCode: 500,
    body: {
      message: error.message
    }.to_json
  }
  end
end