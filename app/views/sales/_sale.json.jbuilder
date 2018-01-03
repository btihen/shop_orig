json.extract! sale, :id,
                    :sale_payment_method,
                    :register_id,
                    :created_at,
                    :updated_at
json.url sale_url(sale, format: :json)
