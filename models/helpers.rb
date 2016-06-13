def resource_not_found
  {status: 404, error: 'Resource not found' }.to_json
end

def bad_request
  {status: 400, error: 'Bad request' }.to_json
end

def server_error
  {status: 500, error: 'Internal server error' }.to_json
end
