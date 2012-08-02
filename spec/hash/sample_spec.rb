require 'spec_helper'

describe Hash do
  describe "#sample" do
    context "empty hash" do
      subject { Hash.new }

      it do
        subject.sample.should == nil
      end

      it do
        subject.sample(1).should == []
      end

      it do
        subject.sample(5).should == []
      end
    end

    context "one key" do
      subject { { a: 10 } }

      it do
        subject.sample.should == :a
      end

      it do
        subject.sample(1).should == [:a]
      end

      it do
        subject.sample(2).should == [ :a, :a ]
      end

      it do
        o = Object.new
        def o.to_int; 1; end
        subject.sample(o).should == [:a]
      end

      it do
        o = Object.new
        lambda { subject.sample(o) }.should raise_error TypeError
      end

      it do
        o = Object.new
        def o.to_int; ''; end
        lambda { subject.sample(o) }.should raise_error TypeError
      end

      it do
        lambda { subject.sample -7 }.should raise_error ArgumentError
      end
    end

    context "Chi-square test" do
      before do
        @h = { a: 10, b: 10, c: 25, d: 1, e: 2, f: 2, g: 5, h: 10, i: 20, j: 15 }
      end

      def calc_chi2 dist, excepted_freq
        excepted_freq.inject( 0.0 ) { |r,x|
          k,v = *x
          r += ((dist[k] - v) ** 2).to_f / v
          r
        }
      end

      it "should be same probability" do
        chi2_9 = [
          14.684, 12.242, 10.656, 9.414, 8.343,
          7.357,  6.393,  5.380, 4.168, 0.000,
        ]

        f1 = Hash[ @h.map { |k,x| [ k, 1.0 * x / @h.values.inject(&:+) * 1000 ] } ]
        count = Hash.new(0)
        2000.times {
          stats = @h.sample(1000).inject( Hash.new(0) ) { |h,k| h[k]+=1; h }
          chi2 = calc_chi2 stats, f1
          i = chi2_9.find_index { |x| chi2 > x }
          count[i] += 1
        }
        f2 = Hash[ (0..9).map { |x| [ x, 200 ] } ]

        chi2 =  calc_chi2 count, f2
        chi2.should < 21.666    # 1%
      end
    end
  end
end
