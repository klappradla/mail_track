# mail_track

"mail_track" is a small Ruby on Rails app showcasing how to track email recipients opening emails and clicking links within them.

The app sends HTML email from your personal Gmail account using the [roadie gem](https://github.com/Mange/roadie) to inline CSS, make global links, etc. (version 2.4.3 as I prefer this to the new roadie-rails gem so far). For secure configuration, your Gmail credentials have to be set as ENV-variables using [figaro](https://github.com/laserlemon/figaro).<br>
So be sure to run
```ruby
figaro install
```
first and add your `gmail_username:` and `gmail_pw:` to the new `application.yml` file.

## open email

Tracking recipients opening an email is archived through including an invisible transparent 1 by 1 pixel image in each mail.<br>
On opening, the recipient's client requests the image from the server using a custom route:
```ruby
# route for tracking image
get '/tracking/:email_id', to: 'emails#image', as: 'tracking_image'
```
The controller handling the request can than log the recipient's activity and send the invisible image:
```ruby
def image
	email = Email.find params[:email_id]
	email.increment!(:opened, 1)
	send_file TRACKING_IMAGE_PATH
end
```

## track clicks

Tracking clicks in email is archived through adding a `&click?` token to each link url.<br>
A `before_filter` within the ApplicationController intercepts each request to check for the token:
```ruby
def track_click
  	if request.url.include? Link::TRACKING_TOKEN
  		url = request.url.slice(0...(request.url.index(Link::TRACKING_TOKEN)))
  		Link.find(params[:id]).click
  		redirect_to url
	  end
  end
```
For requests containing a token a click activity is logged for the respective link and the user redirected to the original url without token (url in browser's address-bar changes quickly). The url would of couse point to the same page, even without stripping away the token - but I prever a clean url for the user.