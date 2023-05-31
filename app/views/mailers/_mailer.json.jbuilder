json.extract! mailer, :id, :to, :subject, :body, :created_at, :updated_at
json.url mailer_url(mailer, format: :json)
