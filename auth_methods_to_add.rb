# auth required for post, put, delete
# post '/testauth/?' do
#   protected!
#   headers_auth
#   return JSON.generate({ 'message' => 'nice work' })
# end

post '/repos/:name/?' do
  protected!
  headers_auth
  res = add_repo()
  if res.result_status == 1
    status 201
    body JSON.generate({ "message" => f"created" })
  else
    halt 400
  end
end

put '/repos/:name/?' do
  protected!
  headers_auth
  res = edit_repo()
  if res.result_status == 1
    status 201
    body JSON.generate({ "message" => "record modified" })
  else
    halt 400
  end
end

delete '/repos/:name/?' do
  protected!
  headers_auth
  res = delete_repo()
  if res['deleted']
    status 204
    body ''
  else
    res.delete('deleted')
    halt 400
  end
end
