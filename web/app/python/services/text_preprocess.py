import re

def remove_multiple_spaces(text: str) -> str:
    """
    This function removes multiple spaces from a text.

    Parameters:
    text : str
        The text to be modified.

    Returns:
    str
        The text with multiple spaces removed.
    """
    return re.sub(r"\s+", " ", text)



def remove_punctuation(text: str) -> str:
    """
    This function removes all types of punctuation from a text.

    Parameters:
    text : str
        The text to be modified.

    Returns:
    str
        The text without any punctuation.
    """

    # Remove all punctuation characters (any character that is not a letter, digit, or whitespace)
    text = re.sub(r"[^\w\s]", "", text)

    return text



def remove_numbers(text: str) -> str:
    """
    This function removes all digits from a string.

    Parameters:
    text : str
        The string from which the digits should be removed.

    Returns:
    str
        The string without the digits.
    """
    return re.sub(r"\d+", "", text)



def preprocess_text(text):
    """
    This function applies preprocessing to a text and returns
    both the original text and the preprocessed text in a tuple.

    Parameters:
    text : str
        The text to be preprocessed.

    Returns:
    Tuple[str, str]
        A tuple containing the original text and the preprocessed text.
    """

    preprocessed_text = text.lower()
    preprocessed_text = remove_punctuation(preprocessed_text)
    preprocessed_text = remove_numbers(preprocessed_text)
    preprocessed_text = remove_multiple_spaces(preprocessed_text)
    preprocessed_text = preprocessed_text.strip()

    return preprocessed_text