require_relative '../lib/cart.rb'
describe Cart do
  before do 
    @cart = Cart.new
  end
  context "第一種情境：不打折" do 
    it "第一集買1本" do
      @cart.add({ "1st": 1, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(100)
    end

    it "第一集買3本" do
      @cart.add({ "1st": 3, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(300)
    end
  end

  context "第二種情境：打 5%折扣" do
    it "第一集買 1 本、第二集買 1 本" do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(190)
    end

    it "第一集買 2 本、第二集買 2 本" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(380)
    end

    it "第一集買 1 本、第二集買 2 本" do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(290)
    end

    it "第一集買 2 本、第二集買 3 本" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(480)
    end
    it "第一集買 2 本、第三集買 3 本" do
      @cart.add({ "1st": 2, "2nd": 0, "3rd": 3, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(480)
    end
  end

  context "第三種情境：打 10%折扣" do
    # 0.9*1  全都九折
    it "第一集買 1 本、第二集買 1 本、第三集買1本" do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(270)
    end
    #0.9*2  全都九折
    it "第一集買 2 本、第二集買 2 本、第三集買2本" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(540)
    end
    # 0.95 *0  0.9*2  1*3   九折加上原價
    it "第一集買 2 本、第二集買 2 本、第三集買3本" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 3, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(640)
    end
    # 0.95 *1  0.9*2  1*0  九折加上九五折
    it "第一集買 2 本、第二集買 3 本、第三集買3本" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 3, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(730)
    end
    # 0.95*1  0.9*1  1*1  九折九五折原價各一
    it "第一集買 1 本、第二集買 2 本、第三集買3本" do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 3, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(560)
    end
  end

end