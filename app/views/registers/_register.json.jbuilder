json.extract! register, :id,
                        :register_currency,
                        :register_start_amount,
                        :register_close_amount,
                        :register_cash_deposit,
                        :user_id,
                        :created_at,
                        :updated_at
json.url register_url(register, format: :json)
