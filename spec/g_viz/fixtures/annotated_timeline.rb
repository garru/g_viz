#http://code.google.com/apis/visualization/documentation/gallery/annotatedtimeline.html
# data.addColumn('date', 'Date');
# data.addColumn('number', 'Sold Pencils');
# data.addColumn('string', 'title1');
# data.addColumn('string', 'text1');
# data.addColumn('number', 'Sold Pens');
# data.addColumn('string', 'title2');
# data.addColumn('string', 'text2');
# data.addRows(6);
# data.setValue(0, 0, new Date(2008, 1 ,1));
# data.setValue(0, 1, 30000);
# data.setValue(0, 4, 40645);
# data.setValue(1, 0, new Date(2008, 1 ,2));
# data.setValue(1, 1, 14045);
# data.setValue(1, 4, 20374);
# data.setValue(2, 0, new Date(2008, 1 ,3));
# data.setValue(2, 1, 55022);
# data.setValue(2, 4, 50766);
# data.setValue(3, 0, new Date(2008, 1 ,4));
# data.setValue(3, 1, 75284);
# data.setValue(3, 4, 14334);
# data.setValue(3, 5, 'Out of Stock');
# data.setValue(3, 6, 'Ran out of stock on pens at 4pm');
# data.setValue(4, 0, new Date(2008, 1 ,5));
# data.setValue(4, 1, 41476);
# data.setValue(4, 2, 'Bought Pens');
# data.setValue(4, 3, 'Bought 200k pens');
# data.setValue(4, 4, 66467);
# data.setValue(5, 0, new Date(2008, 1 ,6));
# data.setValue(5, 1, 33322);
# data.setValue(5, 4, 39463);
mapping = [[:date, 'Date'],[:sold_pencils, 'Solid Pencils'], [:title1, 'title1'], [:text1, 'text1'], 
            [:sold_pens, 'Sold Pens'], [:title2, 'title2'], [:text2, 'text2']]

data = [
  {:date => "2008-01-01", :sold_pencils => 30000, :sold_pens => 40645},
  {:date => Date.parse("2008-01-02"), :sold_pencils => 14045, :sold_pens => 20374},
  {:date => Date.parse("2008-01-03"), :sold_pencils => 55022, :sold_pens => 50766},
  {:date => Date.parse("2008-01-04"), :sold_pencils => 75284, :sold_pens => 14334, :title2 => 'Out of Stock',:text2 => 'Ran out of stock on pens at 4pm'},
  {:date => Date.parse("2008-01-05"), :sold_pencils => 41476, :sold_pens => 66467, :title1 => 'Bought Pens',:text2 => 'Bought 200k pens'},
  {:date => Date.parse("2008-01-06"), :sold_pencils => 33322, :sold_pens => 39463, :title1 => 'Bought Pens',:text2 => 'Bought 200k pens'}
]

@test_data = [data, mapping]
