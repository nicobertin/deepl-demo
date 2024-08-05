require 'net/http'
require 'uri'
require 'json'

class DeepLService
  DEEPL_API_KEY = ENV['DEEPL_API_KEY']

  def self.translate(text, target_lang)
    url = URI.parse("https://api-free.deepl.com/v2/translate")
    request = Net::HTTP::Post.new(url)
    request['Authorization'] = "DeepL-Auth-Key #{DEEPL_API_KEY}"
    request['Content-Type'] = 'application/x-www-form-urlencoded'

    params = {
      text: text,
      target_lang: target_lang
    }
    request.set_form_data(params)

    response = Net::HTTP.start(url.hostname, url.port, use_ssl: url.scheme == 'https') do |http|
      http.request(request)
    end

    result = JSON.parse(response.body)
    
    result['translations'].first['text']
  rescue Net::HTTPExceptions => e
    Rails.logger.error("DeepL API Error: #{e.message}")
    nil
  end
end
