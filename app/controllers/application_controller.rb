class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :upgrade_browser

  private
  # def upgrade_browser
  #   unless browser.modern?
  #     # Rails.logger.debug "*" * 50
  #     # Rails.logger.debug "USER: #{current_user.username} & #{current_user.email} - AGENT-MODERN: #{browser.modern?} - AGENT: #{browser.name} - #{browser.full_version}"
  #     # Rails.logger.debug "*" * 50
  #     # Rollbar.info("USERNAME: #{current_user.username} -- EMAIL: #{current_user.email} - AGENT-MODERN: #{browser.modern?} - AGENT: #{browser.name} - #{browser.full_version}")
  #     # render plain: 'PLEASE USE A MODERN BROWSER like CHROME or FIREFOX -- Your browser is not supported!'
  #     render html: %Q{<h1>PLEASE UPGRADE YOUR BROWSER<br>
  #       <small>Your browser is not modern nor supported!</small></h1>
  #       <h2>This site is tested using CHROME and FIREFOX</h2>
  #       MODERN BROWSER DOWNLOADS:
  #       <ul>
  #         <li><a href="https://www.google.com/chrome/browser/desktop/index.html?brand=CHBD&gclid=Cj0KCQiAgZTRBRDmARIsAJvVWAtRwYlzcKEQZnaIqnV1VBq4c-ov1rqkaDVypCZRfzkujk6T2gKdLzkaAmN8EALw_wcB"><b>Download Chrome</b></a></li>
  #         <li><a href="https://www.mozilla.org/en-US/firefox/new/"><b>Download Firefox</b></a></li>
  #       </ul>
  #       }.html_safe
  #   end
  # end

end
