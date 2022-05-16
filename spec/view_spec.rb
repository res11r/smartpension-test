require './view'

describe View do 
  views_array1 = [View.new('/contact', '123.456.789'), View.new('/about', '455.456.789'), View.new('/about', '455.456.789'), View.new('/about', '455.455.789')]
  views_array2 = [View.new('/contact', '123.456.789')]
  views_array3 = [View.new('/contact', '123.456.789'), View.new('/contact', '123.456.789'), View.new('/contact', '777.456.789'),
    View.new('/about', '123.456.789'), View.new('/about', '777.456.789'), View.new('/about', '888.456.789'),
    View.new('/help_page', '123.456.789')]
  describe ".total_views" do 
    it "takes an array of views with duplicate visitors, returns an array with paths and their corresponding total views in a descending order" do   
      expect(View.total_views(views_array1)).to eql([["/about", ["455.456.789", "455.456.789", "455.455.789"]], ["/contact", ["123.456.789"]]])
    end
    it "returns an array with paths and their corresponding total views in a descending order, when there is only one visit" do   
      expect(View.total_views(views_array2)).to eql([["/contact", ["123.456.789"]]])
    end  
  end
  describe ".unique_views" do 
    it "takes an array of views with duplicate visitors, returns an array with paths and their corresponding unique views in a descending order" do
      expect(View.unique_views(views_array1)).to eql([["/about", ["455.456.789", "455.455.789"]], ["/contact", ["123.456.789"]]]) 
    end
    it "returns an array with paths and their corresponding unique views in a descending order, takes an array with duplicate visitors, unordered uniques list" do
      expect(View.unique_views(views_array3)).to eql([["/about", ["123.456.789", "777.456.789", "888.456.789"]], 
        ["/contact", ["123.456.789", "777.456.789"]],
        ["/help_page", ["123.456.789"]]]) 
    end 
  end 
end