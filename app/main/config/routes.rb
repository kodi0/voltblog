# See https://github.com/voltrb/volt#routes for more info on routes

get '/about', _action: 'about'
get '/articles/{{__id}}', _controller: 'articles', _action: 'show'
# Routes for login and signup, provided by user-templates component gem
get '/signup', _controller: 'user-templates', _action: 'signup'
get '/login', _controller: 'user-templates', _action: 'login'

get '/users/{{__id}}', _controller: 'users', _action: 'show'

# The main route, this should be last. It will match any params not
# previously matched.
get '/', _controller: 'articles' , _action: 'index'
