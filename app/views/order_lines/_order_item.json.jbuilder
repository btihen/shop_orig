json.extract! order_line, :id,
                          :order_line_quantity,
                          :order_line_note,
                          :order_line_actual_purchase_price,
                          :created_at,
                          :updated_at
json.url order_line_url(order_line, format: :json)
