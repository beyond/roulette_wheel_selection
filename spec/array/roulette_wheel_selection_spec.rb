require 'spec_helper'

describe Array do
  describe "#roulette_wheel_selection" do
    context "empty" do
      subject { Array.new }

      it do
        subject.roulette_wheel_selection.should == nil
      end

      it do
        subject.roulette_wheel_selection(1).should == []
      end

      it do
        subject.roulette_wheel_selection(5).should == []
      end
    end

    context "one value" do
      subject { [10] }

      it do
        subject.roulette_wheel_selection.should == 0
      end

      it do
        subject.roulette_wheel_selection(1).should == [0]
      end

      it do
        subject.roulette_wheel_selection(2).should == [ 0, 0 ]
      end

      it do
        o = Object.new
        def o.to_int; 1; end
        subject.roulette_wheel_selection(o).should == [0]
      end

      it do
        o = Object.new
        lambda { subject.roulette_wheel_selection(o) }.should raise_error TypeError
      end

      it do
        o = Object.new
        def o.to_int; ''; end
        lambda { subject.roulette_wheel_selection(o) }.should raise_error TypeError
      end

      it do
        lambda { subject.roulette_wheel_selection -7 }.should raise_error ArgumentError
      end
    end
  end
end
