json.extract! supplier_package, :id,
                                :product_id,
                                :included_product_id,
                                :included_quantity,
                                :created_at,
                                :updated_at
json.url supplier_package_url(supplier_package, format: :json)
