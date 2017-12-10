json.extract! supplier, :id,  :supplier_name,
                              :supplier_currency,
                              :supplier_web_url,
                              :supplier_email,
                              :supplier_phone,
                              :supplier_address_1,
                              :supplier_address_2,
                              :supplier_city,
                              :supplier_region,
                              :supplier_postcode,
                              :supplier_country_code,
                              :supplier_notes,
                              :created_at,
                              :updated_at

json.url supplier_url(supplier, format: :json)
