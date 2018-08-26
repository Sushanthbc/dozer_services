# frozen_string_literal: true

class CatchJsonParseErrors
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue ActionDispatch::ParamsParser::ParseError => error
    if /application\/json/.match?(env['HTTP_ACCEPT'])
      error_output = "There was a problem in the JSON you submitted: #{error}"
      [
        400, { 'Content-Type' => 'application/json' },
        [{ status: 400, error: error_output }.to_json]
      ]
    else
      raise error
    end
  end
end
