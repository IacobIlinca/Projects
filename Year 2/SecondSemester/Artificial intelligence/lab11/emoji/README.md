# emoji_data_python - A python emoji toolkit

![CI pipeline](https://github.com/alexmick/emoji-data-python/workflows/CI%20pipeline/badge.svg)
[![PyPI](https://img.shields.io/pypi/v/emoji-data-python.svg)](https://pypi.python.org/pypi/emoji-data-python)
[![Documentation Status](https://readthedocs.org/projects/emoji-data-python/badge/?version=latest)](http://emoji-data-python.readthedocs.io/en/latest/?badge=latest)


Forget about handling obscure shortcodes from slack or user input, this lib knows all about them !

### Features

* Conversion from slack-style colon short codes : `:smiley:` ⇒ 😃
* Lookup emoji by official name or any known short name
* Render emoji chars from their codepoint

## Installing

Installation should be as simple as :

```bash
pip install emoji_data_python
```

## Usage
```python
>>> import emoji_data_python
>>> len(emoji_data_python.emoji_data)
1489
>>> emoji_data_python.emoji_short_names['hearts'].__dict__
{
    'name': 'BLACK HEART SUIT',
    'unified': '2665',
    'variations': ['2665-FE0F'],
    'docomo': 'E68D',
    'au': 'EAA5',
    'softbank': 'E20C',
    'google': 'FEB1A',
    'image': '2665.png',
    'sheet_x': 1,
    'sheet_y': 34,
    'short_name': 'hearts',
    'short_names': ['hearts'],
    'text': None,
    'texts': None,
    'category': 'Symbols',
    'sort_order': 245,
    'added_in': '1.1',
    'has_img_apple': True,
    'has_img_google': True,
    'has_img_twitter': True,
    'has_img_emojione': True,
    'has_img_facebook': True,
    'has_img_messenger': True,
    'skin_variations': {},
    'obsoletes': None,
    'obsoleted_by': None
}
>>> emoji_data_python.find_by_shortname('moon')
[
    EmojiChar("NEW MOON SYMBOL"),
    EmojiChar("WAXING CRESCENT MOON SYMBOL"),
    EmojiChar("FIRST QUARTER MOON SYMBOL"),
    EmojiChar("WAXING GIBBOUS MOON SYMBOL"),
    EmojiChar("FULL MOON SYMBOL"),
    EmojiChar("WANING GIBBOUS MOON SYMBOL"),
    EmojiChar("LAST QUARTER MOON SYMBOL"),
    EmojiChar("WANING CRESCENT MOON SYMBOL"),
    EmojiChar("CRESCENT MOON"),
    EmojiChar("NEW MOON WITH FACE"),
    EmojiChar("FIRST QUARTER MOON WITH FACE"),
    EmojiChar("LAST QUARTER MOON WITH FACE"),
    EmojiChar("FULL MOON WITH FACE"),
]
>>> [ (emoji.name, emoji.short_name, emoji.char) for emoji in emoji_data_python.find_by_name('tree')]
[
    ('EVERGREEN TREE', 'evergreen_tree', '🌲'),
    ('DECIDUOUS TREE', 'deciduous_tree', '🌳'),
    ('PALM TREE', 'palm_tree', '🌴'),
    ('CHRISTMAS TREE', 'christmas_tree', '🎄'),
    ('TANABATA TREE', 'tanabata_tree', '🎋')
]
>>> emoji_data_python.replace_colons('Hello world ! :wave::skin-tone-3: :earth_africa: :exclamation:')
'Hello world ! 👋🏼 🌍 ❗'
```

## Documentation

Documentation is autogenerated by Sphinx. With the right dependencies you should be able to build the docs :

```bash
cd docs/
pip install -r requirements.txt # Install sphinx and its plugins
make html
cd _build/html
python -m SimpleHttpServer # Serve the docs on localhost:5000
```

A pre-built hosted version is available here : http://emoji-data-python.readthedocs.io/en/latest/

## Testing

```bash
python -m unittest discover
```

###### Thanks to [iamcal](https://github.com/iamcal/emoji-data) for the complete emoji data. This project is merely a python wrapper for his work.