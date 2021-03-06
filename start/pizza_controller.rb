require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')

get '/pizza-orders' do #INDEX
  @orders = PizzaOrder.all()
  erb(:index)
end

get '/pizza-orders/new' do
  erb(:new)
end

get '/pizza-orders/:id' do #SHOW
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizza-orders' do #CREATE
  @order = PizzaOrder.new(params)
  @order.save
  erb(:create)
end

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect('/pizza-orders')
end

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect('/pizza-orders')
end
