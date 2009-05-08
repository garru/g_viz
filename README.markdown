# GViz

GViz is a simple Ruby wrapper for the Google Visualization API

## Usage

GViz::Base keeps track of charts that need to be rendered.

    chart = GViz::Base.new
    dom_id = chart.add_graph(graph_type, data, mapping, config_options)
    chart.output

You can add multiple visualizations

    chart = GViz::Base.new
    dom_id1 = chart.add_graph(graph_type, data, mapping, config_options)
    dom_id2 = chart.add_graph(graph_type, data, mapping, config_options)
    chart.output


### AnnotatedTimeLine
    mapping = [[:date, 'Date'],[:sold_pencils, 'Solid Pencils'], [:title1, 'title1'], [:text1, 'text1'], 
              [:sold_pens, 'Sold Pens'], [:title2, 'title2'], [:text2, 'text2']]

    data = [
      {:date => "2008-02-01", :sold_pencils => 30000, :sold_pens => 40645},
      {:date => Date.parse("2008-02-02"), :sold_pencils => 14045, :sold_pens => 20374},
      {:date => Date.parse("2008-02-03"), :sold_pencils => 55022, :sold_pens => 50766},
      {:date => Date.parse("2008-02-04"), :sold_pencils => 75284, :sold_pens => 14334, :title2 => 'Out of Stock',:text2 => 'Ran out of stock on pens at 4pm'},
      {:date => Date.parse("2008-02-05"), :sold_pencils => 41476, :sold_pens => 66467, :title1 => 'Bought Pens',:text2 => 'Bought 200k pens'},
      {:date => Date.parse("2008-02-06"), :sold_pencils => 33322, :sold_pens => 39463, :title1 => 'Bought Pens',:text2 => 'Bought 200k pens'}
    ]

    g = GViz::Base.new
    g.add_annotated_time_line(data, mapping)
    output = g.output
<script src="http://gist.github.com/108528.js"></script>
