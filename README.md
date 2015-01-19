# mail_track

"mail_track" is a small Ruby on Rails app showcasing how to track email recipients opening emails and clicking links within them.

The app sends out HTML email using the [roadie gem](https://github.com/Mange/roadie) to inline CSS, make global links, etc. (version 2.4.3 as I prefer this to the new roadie-rails gem so far).

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