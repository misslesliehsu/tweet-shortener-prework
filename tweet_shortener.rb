  def dictionary
    dictionary = {
      "hello" => "hi",
      "to" => "2",
      "two" => "2",
      "too" => "2",
      "for" => "4",
      "four" => "4",
      "be" => "b",
      "you" => "u",
      "at" => "@" ,
      "and" => "&"
    }
  end


  def word_substituter(tweet)
    array = tweet.split(" ")
    cleaned = array.collect do |word|
      if dictionary.include?(word) || dictionary.include?(word.downcase)
        dictionary[word.downcase]
      else word
      end
    end
    return cleaned.join(" ")
  end

  def bulk_tweet_shortener(tweets)
      tweets.collect do |tweet|
      puts word_substituter(tweet)
    end
  end

  def selective_tweet_shortener(tweet)
    if tweet.length > 140
      word_substituter(tweet)
    else
      tweet
    end
  end

  def shortened_tweet_truncator(tweet)
    if selective_tweet_shortener(tweet).length > 140
      selective_tweet_shortener(tweet)[0..136] + "..."
    else
      selective_tweet_shortener(tweet)
    end
  end
