# ruby encoding: utf-8

# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

ProductCategory.destroy_all

product_category_list = [
  [ "Acsessoir", "Standard" ],
  [ "Ausverkauf", "Standard" ],
  [ "Beutel", "Standard" ],
  [ "Beutel Brokat", "Standard" ],
  [ "Buddha-Bilder", "Standard" ],
  [ "Bücher", "Standard" ],
  [ "Bücher CD", "Standard" ],
  [ "Bücher Hülle", "Standard" ],
  [ "Bücher, Buchzeichen", "Standard" ],
  [ "CD", "Standard" ],
  [ "CD Kids", "Standard" ],
  [ "DVD", "Standard" ],
  [ "Deko", "Standard" ],
  [ "Deko Aufkleber", "Standard" ],
  [ "Foto Album", "Standard" ],
  [ "Foto mit Rahmen", "Standard" ],
  [ "Fotos", "Standard" ],
  [ "Fotos Album", "Standard" ],
  [ "Gebetsfahnen", "Standard" ],
  [ "Gebrauchsgegenst. Ripa Logo", "Standard" ],
  [ "Gebrauchsgegenstände div", "Standard" ],
  [ "Haushalt", "Standard" ],
  [ "Haushalt Elektro", "Standard" ],
  [ "Kathag", "Standard" ],
  [ "Kerzen", "Standard" ],
  [ "Khatag", "Standard" ],
  [ "Klangschale", "Standard" ],
  [ "Klangschalen", "Standard" ],
  [ "Klangschalen Zubehör", "Standard" ],
  [ "Klangschalenzubehör", "Standard" ],
  [ "Kleidung", "Standard" ],
  [ "Lebensmittel", "Reduced" ],
  [ "Mala", "Standard" ],
  [ "Mala Braclet", "Standard" ],
  [ "Mala Braclet Kids", "Standard" ],
  [ "Mala Counter", "Standard" ],
  [ "Mala Counters", "Standard" ],
  [ "Malas", "Standard" ],
  [ "Meditation", "Standard" ],
  [ "Meditation Kissen", "Standard" ],
  [ "Meditation Manuals", "Standard" ],
  [ "Meditation Text", "Standard" ],
  [ "Meditationskissen", "Standard" ],
  [ "Papeterie", "Standard" ],
  [ "Papeterie Cards", "Standard" ],
  [ "Papeterie, Cards", "Standard" ],
  [ "Pflegeartikel", "Standard" ],
  [ "Poster", "Standard" ],
  [ "Raumbeduftung", "Standard" ],
  [ "Ritual Objects", "Standard" ],
  [ "Räucherstäbli", "Standard" ],
  [ "Räucherwerk", "Standard" ],
  [ "Räucherwerk Gefässe", "Standard" ],
  [ "Schmuck", "Standard" ],
  [ "Shawls", "Standard" ],
  [ "Skulpturen / Bilder", "Standard" ],
  [ "Skulpturen/Bilder", "Standard" ],
  [ "Statuen", "Standard" ],
  [ "Steine", "Standard" ],
  [ "Teachings", "Standard" ],
  [ "Tee", "Reduced" ],
  [ "Thankas", "Standard" ],
  [ "Tischgebet", "Standard" ],
  [ "shawls", "Standard" ],
  [ "unknown", "Standard" ],
]

product_category_list.each do |product_category_name, tax_category |
  ProductCategory.create(
                          product_category_name: product_category_name,
                          tax_category: TaxCategory.
                                        where(tax_category_name: tax_category).
                                        first
                        )
end
