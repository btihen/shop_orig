class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :upgrade_browser

  private
  def upgrade_browser
    unless browser.modern?
      render html: %Q{<h1>PLEASE UPGRADE YOUR BROWSER<br>
        <small>Your browser is not modern nor supported!</small></h1>
        <h2>This site is tested on CHROME and FIREFOX</h2>
        MODERN VERSIONS ARE AVAILABLE HERE:
        <ul>
          <li><a href="https://www.google.com/chrome/browser/desktop/index.html?brand=CHBD&gclid=Cj0KCQiAgZTRBRDmARIsAJvVWAtRwYlzcKEQZnaIqnV1VBq4c-ov1rqkaDVypCZRfzkujk6T2gKdLzkaAmN8EALw_wcB"><b>Download Chrome</b></a></li>
          <li><a href="https://www.mozilla.org/en-US/firefox/new/"><b>Download Firefox</b></a></li>
        </ul>
        }.html_safe
    end
  end

end
