module MembersHelper
  def screenshot_url(page_url)
    "https://api.thumbalizr.com/?url=#{page_url}&width=640&api_key=34UHgDjNTRh2LVG8oRWtAP19mh0D"
  end
end
