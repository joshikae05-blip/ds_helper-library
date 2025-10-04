import pandas as pd
import string
import nltk 
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer

nltk.download('stopwords')
nltk.download('wordnet')

def clean_text(text_series, remove_punct=True, remove_stopwords=True, remove_fillers=True, lowercase=True, lemmatize=False):
    pass

sample_data = [
    "This is the FIRST sentence, uh, with lots of stopwords.",
    "And here is another one... like, um, just for testing!",
    "Finally, a third sentence. It's GREAT, isn't it?"
]

text_series = pd.Series(sample_data)

print("--- Original Text Data ---")
print(text_series)

def clean_text(text_series, remove_punct=True, remove_stopwords=True, remove_fillers=True, lowercase=True, lemmatize=False):
    if lowercase:
        text_series = text_series.str.lower()

    if remove_punct:
        text_series = text_series.str.translate(str.maketrans('', '', string.punctuation))

    if remove_stopwords or remove_fillers:
        stop_words = set(stopwords.words('english'))
        
        if remove_fillers:
            filler_words = {'uh', 'um', 'like'}
            stop_words.update(filler_words)
        
        def filter_words(sentence):
            return ' '.join([word for word in sentence.split() if word not in stop_words])
        
        text_series = text_series.apply(filter_words)

    if lemmatize:
        lemmatizer = WordNetLemmatizer()
        def lemmatize_words(sentence):
            return ' '.join([lemmatizer.lemmatize(word) for word in sentence.split()])

        text_series = text_series.apply(lemmatize_words)
        
    return text_series

cleaned_series = clean_text(text_series)

print("\n--- Cleaned Text Data ---")
print(cleaned_series)