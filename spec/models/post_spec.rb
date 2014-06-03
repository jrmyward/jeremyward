require 'spec_helper'

describe Post do
  it { should respond_to(:abstract) }
  it { should respond_to(:author_id) }
  it { should respond_to(:body) }
  it { should respond_to(:commentable) }
  it { should respond_to(:description) }
  it { should respond_to(:image) }
  it { should respond_to(:published_at) }
  it { should respond_to(:slug) }
  # it { should respond_to(:tag_list) }
  it { should respond_to(:title) }

  describe "Lists" do
    it "finds published" do
      a = create(:post, published_at: 2.weeks.ago)
      b = create(:post, published_at: 2.weeks.from_now)
      expect(Post.published).to include(a)
      expect(Post.published).to_not include(b)
    end

    it "finds unpublished" do
      a = create(:post, published_at: 2.weeks.ago)
      b = create(:post, published_at: 2.weeks.from_now)
      expect(Post.unpublished).to include(b)
      expect(Post.unpublished).to_not include(a)
    end
  end

  it "keeps existing slug" do
    a = create(:post, published_at: 2.weeks.ago)
    a.update_attribute(:title, "Hello World 2")
    expect(a.slug).to eq("hello-world")
  end

  it "knows if it's the last published post" do
    a = create(:post, published_at: 2.weeks.ago)
    b = create(:post, published_at: 1.week.ago)
    c = create(:post, published_at: 2.weeks.from_now)
    expect(a).to_not be_last_published
    expect(b).to be_last_published
    expect(c).to_not be_last_published
  end

  describe "editable_by?" do
    before(:each) do
      @admin    = create(:user, role: "admin")
      @author_1 = create(:user, role: "author")
      @author_2 = create(:user, role: "author")
      @post     = create(:post, author_id: @author_1.id, published_at: 1.week.ago)
    end

    it "should be true for admins" do
      expect(@post.editable_by?(@admin)).to be true
    end

    it "should allow the author to edit" do
      expect(@post.editable_by?(@author_1)).to be true
    end

    it "should not allow a different author to edit" do
      expect(@post.editable_by?(@author_2)).to be false
    end

    it "should handle nil users" do
      expect(@post.editable_by?(nil)).to be false
    end
  end

  describe "commentable?" do
    it "should allow comments" do
      allows_comments = create(:post, commentable: true)
      expect(allows_comments.commentable?).to be true
    end
  end

  describe "published_date" do
    it "returns an empty string for unpublished posts" do
      unpublished_post = create(:post)
      expect(unpublished_post.published_date).to eq ""
    end

    it "returns a formated date string" do
      published_post = create(:post, published_at_string: "07/04/2013")
      expect(published_post.published_date).to eq "04 Jul 2013"
    end
  end

  # describe "Tags" do
  #   it "assigns tags to a post" do
  #     post = create(:post, :tag_list => 'foo, bar')
  #     expect(post.tag_list).to eq(%w[foo bar])
  #   end

  #   describe "tag_list_sorted" do
  #     it "returns an array of tags in alphabetical order" do
  #       post = create(:post, :tag_list => 'foo, bar')
  #       expect(post.tag_list_sorted).to eq(%w[bar foo])
  #     end
  #   end
  # end

  describe "Validations" do
    [:abstract, :body, :description, :title].each do |attr|
      it "#{attr} must have a value" do
        post = build(:post, attr => nil)
        expect(post).to_not be_valid
        expect(post.errors[attr]).to_not be_nil
      end
    end
  end

end
