# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../rails_helper'

describe HoshiMi::Resolution do
  before do
    @time = Time.now
  end

  describe "hour" do
    before do
      @resolution = HoshiMi::Resolution.hour
    end

    context "begin" do
      subject { @resolution.beginning_of @time }
      it { should == @time.change(:min => 0) }
    end

    context "end" do
      subject { @resolution.end_of @time }
      it { should == @time.change(:min => 59) }
    end
  end

  describe "day" do
    before do
      @resolution = HoshiMi::Resolution.day
    end

    context "begin" do
      subject { @resolution.beginning_of @time }
      it { should == @time.beginning_of_day }
    end

    context "end" do
      subject { @resolution.end_of @time }
      it { should == @time.end_of_day }
    end
  end

  describe "month" do
    before do
      @resolution = HoshiMi::Resolution.month
    end

    context "begin" do
      subject { @resolution.beginning_of @time }
      it { should == @time.beginning_of_month }
    end

    context "end" do
      subject { @resolution.end_of @time }
      it { should == @time.end_of_month }
    end
  end

  describe "comparable" do
    subject { HoshiMi::Resolution.day }
    it { should < HoshiMi::Resolution.month }
    it { should == HoshiMi::Resolution.day }
    it { should > HoshiMi::Resolution.hour }
  end

  describe "default value" do
    context "specified" do
      before do
        hoshi_mi_resolution("hour") {
          @resolution = HoshiMi::Resolution.default
        }
      end

      subject { @resolution }
      it { should == HoshiMi::Resolution.hour }
    end

    context "not specified" do
      before do
        hoshi_mi_resolution(nil) {
          @resolution = HoshiMi::Resolution.default
        }
      end

      subject { @resolution }
      it { should == HoshiMi::Resolution.day }
    end
  end
end
