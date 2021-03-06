require_relative "../lib/set"
describe SetGame::Set do

  it "returns 6 sets of 3 cards for valid game with 12 cards" do
    # screenshot of the game is at misc/1.png
    cards =
      [
        "two red empty diamonds",
        "three green empty diamonds",
        "one purple empty squiggle",
        "two red empty ovals",

        "two green solid ovals",
        "one purple shaded squiggle",
        "one purple empty diamond",
        "two red shaded ovals",

        "two green shaded ovals",
        "one purple solid oval",
        "one green empty squiggle",
        "three green solid diamonds",
      ]
    sets =
      [["two red empty diamonds",
        "three green empty diamonds",
        "one purple empty diamond"],
       ["three green empty diamonds",
        "one purple empty squiggle",
        "two red empty ovals"],
       ["one purple empty squiggle",
        "two red shaded ovals",
        "three green solid diamonds"],
       ["two red empty ovals",
        "one purple shaded squiggle",
        "three green solid diamonds"],
       ["one purple shaded squiggle",
        "one purple empty diamond",
        "one purple solid oval"],
       ["two green shaded ovals",
        "one green empty squiggle",
        "three green solid diamonds"]]
    SetGame::Set.sets(cards).should == sets
  end
  it "knows if 3 cards are a valid set" do
    cards =
      [
        "one purple solid squiggle",
        "two purple solid squiggles",
        "three purple solid squiggles",
      ]
    SetGame::Set.valid?(cards).should == true
  end
  it "knows if 3 cards are not a valid set" do
    cards =
      [
        "one purple solid squiggle",
        "one purple solid squiggle",
        "three purple solid squiggles",
      ]
    SetGame::Set.valid?(cards).should == false
  end
  it "knows if one feature of a set is the same for all cards" do
    cards =
      [
        "one purple solid squiggle",
        "three purple solid squiggles",
        "three purple solid squiggles",
      ]
    SetGame::Set.feature_the_same_for_all_cards(:count, cards).should == false
    SetGame::Set.feature_the_same_for_all_cards(:color, cards).should == true
    SetGame::Set.feature_the_same_for_all_cards(:shape, cards).should == true
  end
  it "knows if one feature of a set is different for all cards" do
    cards =
      [
        "one purple solid squiggle",
        "two purple solid squiggles",
        "three purple solid squiggles",
      ]
    SetGame::Set.feature_different_for_all_cards(:count, cards).should == true
    SetGame::Set.feature_different_for_all_cards(:color, cards).should == false
    SetGame::Set.feature_different_for_all_cards(:shape, cards).should == false
  end
  it "knows if one feature of a set is either the same or different for all cards" do
    cards =
      [
        "one red solid squiggle",
        "two purple solid squiggles",
        "three purple solid squiggles",
      ]
    SetGame::Set.feature_the_same_or_different_for_all_cards?(:count, cards).should == true
    SetGame::Set.feature_the_same_or_different_for_all_cards?(:color, cards).should == false
    SetGame::Set.feature_the_same_or_different_for_all_cards?(:fill, cards).should == true
  end
end
