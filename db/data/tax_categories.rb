# ruby encoding: utf-8

# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

TaxCategory.destroy_all

# https://www.estv.admin.ch/estv/en/home/mehrwertsteuer/fachinformationen/steuersaetze/entwicklung-mwst.html
tax_category_list = [
  [ "Standard",
    { name: "Standard Tax",
      tax_rates: [
        {rate: 7.7, start_date: "2018-01-01", end_date: nil},
        {rate: 8.0, start_date: "2011-01-01", end_date: "2017-12-31"},
      ]
    }
  ],
  [ "Accomodation",
    { name: "Accomodation Tax",
      tax_rates: [
        {rate: 3.7, start_date: "2018-01-01", end_date: nil},
        {rate: 3.8, start_date: "2011-01-01", end_date: "2017-12-31"},
      ]
    }
  ],
  [ "Reduced",
    { name: "Reduced Tax",
      tax_rates: [
        {rate: 2.5, start_date: "2011-01-01", end_date: nil},
        {rate: 2.4, start_date: "2001-01-01", end_date: "2010-12-31"},
      ]
    }
  ],
]

tax_category_list.each do | tax_category_name, tax_category_name,
                            tax_start_date, tax_end_date |
  TaxCategory.create(
                          tax_category_name: ,
                          tax_category_name: ,
                        )
end

# https://www.estv.admin.ch/estv/en/home/mehrwertsteuer/fachinformationen/steuersaetze/entwicklung-mwst.html

# [ "Standard Tax", "7.70", "2018-01-01", nil ],
# [ "Standard Tax", "8.00", "2011-01-01", "2017-12-31" ],
# [ "Standard Tax", "7.60", "2001-01-01", "2010-12-31" ],
# [ "Standard Tax", "7.50", "1999-01-01", "2000-12-31" ],
# [ "Standard Tax", "6.50", "1996-10-01", "1998-12-31" ],
# [ "Standard Tax", "7.50", "1995-01-01", "1996-09-31" ],
# [ "Hotel Tax", "3.70", "2018-01-01", nil ],
# [ "Hotel Tax", "3.80", "2011-01-01", "2017-12-31" ],
# [ "Hotel Tax", "3.60", "2001-01-01", "2010-12-31" ],
# [ "Hotel Tax", "3.50", "1999-01-01", "2000-12-31" ],
# [ "Hotel Tax", "3.00", "1996-10-01", "1998-12-31" ],
# [ "Hotel Tax", "6.50", "1995-01-01", "1996-09-31" ],
# [ "Reduced Tax", "2.50", "2018-01-01", nil ],
# [ "Reduced Tax", "2.50", "2011-01-01", "2017-12-31" ],
# [ "Reduced Tax", "2.40", "2001-01-01", "2010-12-31" ],
# [ "Reduced Tax", "2.30", "1999-01-01", "2000-12-31" ],
# [ "Reduced Tax", "2.00", "1996-10-01", "1998-12-31" ],
# [ "Reduced Tax", "2.00", "1995-01-01", "1996-09-31" ],
