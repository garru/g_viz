require File.join(File.dirname(__FILE__), '..', 'test_helper')

describe GViz do
  describe 'api' do
    describe 'examples' do
      
      describe 'annotated timeline' do
        @mapping = [[:date, 'Date'],[:sold_pencils, 'Solid Pencils'], [:title1, 'title1'], [:text1, 'text1'], 
                    [:sold_pens, 'Sold Pens'], [:title2, 'title2'], [:text2, 'text2']]

        @data = [
          {:date => "2008-02-01", :sold_pencils => 30000, :sold_pens => 40645},
          {:date => Date.parse("2008-02-02"), :sold_pencils => 14045, :sold_pens => 20374},
          {:date => Date.parse("2008-02-03"), :sold_pencils => 55022, :sold_pens => 50766},
          {:date => Date.parse("2008-02-04"), :sold_pencils => 75284, :sold_pens => 14334, :title2 => 'Out of Stock',:text2 => 'Ran out of stock on pens at 4pm'},
          {:date => Date.parse("2008-02-05"), :sold_pencils => 41476, :sold_pens => 66467, :title1 => 'Bought Pens',:text2 => 'Bought 200k pens'},
          {:date => Date.parse("2008-02-06"), :sold_pencils => 33322, :sold_pens => 39463, :title1 => 'Bought Pens',:text2 => 'Bought 200k pens'}
        ]
        GViz.add_graph('AnnotatedTimeline', @data, @mapping)
        output = GViz.output
        puts output
        output.should == TestHelper.template('rendered_annotated_timeline')
      end
    end
    
    describe 'graph' do
      @games = [{:name => "Gary", :games_won => "2", :birthday => "2008-02-01"},
               {:name => "John", :games_won => "4", :birthday => Date.parse("2009-01-01 11:11")},
               {:name => "A", :games_won => "2", :birthday => "Jun 14 1982"}]
      GViz.add_graph('MotionGraph', @games, [[:name, "Name"], [:games_won, "# Games"]])
    end
  end
  
  describe 'implementation details - class methods' do
    describe 'google_data_type' do
      it "should classify ruby data types to google visualization data types" do
        GViz.google_data_type(Time.now).should == 'datetime'
        GViz.google_data_type(Date.new).should == 'date'
        GViz.google_data_type("June 23 1982").should == 'date'
        GViz.google_data_type("June 23 1982 12:23").should == 'datetime'
        GViz.google_data_type("12312412").should == 'numeric'
        GViz.google_data_type("12312412.1234").should == 'numeric'
        GViz.google_data_type(1234123).should == 'numeric'
        GViz.google_data_type(1234123.1234).should == 'numeric'
        GViz.google_data_type("a123124123").should == 'string'
        # should this really happen?  documenting it because i need to think if this is ok.
        GViz.google_data_type("a12312412").should == 'date'
      end
    end

    describe 'ruby_to_js' do
      it "should return the js string representation of that data " do
        GViz.ruby_to_js('numeric', 12341234).should == 12341234 
        GViz.ruby_to_js('string', 12341234).should == "'12341234'"
        GViz.ruby_to_js('date', "June 23 1982").should == "new Date(1982, 5, 23)"
        GViz.ruby_to_js('date', Date.parse("June 23 1982")).should == "new Date(1982, 5, 23)"
      end
    end
  end
  
  describe 'implmentation details - instances methods' do
    before(:all) do
      @games = [{:name => "Gary", :games_won => "2", :birthday => "2008-02-01"},
               {:name => "John", :games_won => "4", :birthday => Date.parse("2009-01-01 11:11")},
               {:name => "A", :games_won => "2", :birthday => "Jun 14 1982"}]
               
      @rows = [["'Gary'", "2", "new Date(2008, 1, 1)"],
               ["'John'", "4", "new Date(2009, 0, 1)"],
               ["'A'", "2", "new Date(1982, 5, 14)"]]
               
      @gviz = GViz.send(:new, 'bar', @games, [[:name, "Name"], [:games_won, "Games Won"], [:birthday, 'Birthday']])
    end
    
    describe 'columns' do
      it 'should return google data types and labels' do
        @gviz.columns.should == [['string', 'Name'], ['numeric', 'Games Won'], ['date', 'Birthday']]
      end
    
    end
    
    describe 'rows' do
      it 'should return data rows' do
        @gviz.rows.should == @rows
      end
    end
    
  end
end