# GViz

GViz is a simple Ruby wrapper for the Google Visualization API

## Install

    gem install gemcutter
    gem tumble
    gem install JamieFlournoy-g_viz -s 

OR

    gem install JamieFlournoy-g_viz --source http://gemcutter.org


### Definitions
<dl>
  <dt>chart_type</dt>
  <dd>Google Visualization Chart Constructor</dd>
  <dt>data</dt>
  <dd>An array of objects that responds to [](key) i.e. and array of Hashes</dd>
  <dt>mapping</dt>
  <dd>An array of key, description pairs that we are using as data points for our chart</dd>
</dl>

GViz::Base keeps track of charts that need to be rendered.

    chart = GViz::Base.new
    dom_id = chart.add_graph(chart_type, data, mapping, config_options)
    chart.output

You can add multiple visualizations

    chart = GViz::Base.new
    dom_id1 = chart.add_graph(chart_type, data, mapping, config_options)
    dom_id2 = chart.add_graph(chart_type, data, mapping, config_options)
    chart.output
    
You can use dynamic adders
    
    #chart_type for dynamic adders are lowercased and underscored
    chart = GViz::Base.new
    dom_id1 = chart.add_chart_type(data, mapping, config_options)
    chart.output

## Examples
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
    chart_id = g.add_annotated_time_line(data, mapping)
    puts g.output
    puts "<div id='#{chart_id}'></div>"
    
Outputs

    <script type='text/javascript' src='http://www.google.com/jsapi'></script>
    <script type='text/javascript'>
      google.load('visualization', '1', {'packages':['annotatedtimeline']});
      google.setOnLoadCallback(drawChart);
      function drawChart() {    
          var data_0 = new google.visualization.DataTable();
          data_0.addColumn('date', 'Date')
          data_0.addColumn('number', 'Solid Pencils')
          data_0.addColumn('string', 'title1')
          data_0.addColumn('number', 'Sold Pens')
          data_0.addColumn('string', 'title2')
          data_0.addColumn('string', 'text2')
          data_0.addRows(6)
          data_0.setValue(0, 0, new Date(2008, 1, 1))
          data_0.setValue(0, 1, 30000)
          data_0.setValue(0, 2, '')
          data_0.setValue(0, 3, 40645)
          data_0.setValue(0, 4, '')
          data_0.setValue(0, 5, '')
          data_0.setValue(1, 0, new Date(2008, 1, 2))
          data_0.setValue(1, 1, 14045)
          data_0.setValue(1, 2, '')
          data_0.setValue(1, 3, 20374)
          data_0.setValue(1, 4, '')
          data_0.setValue(1, 5, '')
          data_0.setValue(2, 0, new Date(2008, 1, 3))
          data_0.setValue(2, 1, 55022)
          data_0.setValue(2, 2, '')
          data_0.setValue(2, 3, 50766)
          data_0.setValue(2, 4, '')
          data_0.setValue(2, 5, '')
          data_0.setValue(3, 0, new Date(2008, 1, 4))
          data_0.setValue(3, 1, 75284)
          data_0.setValue(3, 2, '')
          data_0.setValue(3, 3, 14334)
          data_0.setValue(3, 4, 'Out of Stock')
          data_0.setValue(3, 5, 'Ran out of stock on pens at 4pm')
          data_0.setValue(4, 0, new Date(2008, 1, 5))
          data_0.setValue(4, 1, 41476)
          data_0.setValue(4, 2, 'Bought Pens')
          data_0.setValue(4, 3, 66467)
          data_0.setValue(4, 4, '')
          data_0.setValue(4, 5, 'Bought 200k pens')
          data_0.setValue(5, 0, new Date(2008, 1, 6))
          data_0.setValue(5, 1, 33322)
          data_0.setValue(5, 2, 'Bought Pens')
          data_0.setValue(5, 3, 39463)
          data_0.setValue(5, 4, '')
          data_0.setValue(5, 5, 'Bought 200k pens')
          var chart_data_0 = new google.visualization.AnnotatedTimeline(document.getElementById('annotatedtimeline0'));
          chart_data_0.draw(data_0, {});
      }
    </script>
    <div id='annotatedtimeline0'></div>

