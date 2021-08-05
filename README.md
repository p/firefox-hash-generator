# Firefox/Waterfox/Pale Moon Hash Generator

This library generates the hashes for firefox and derived browsers' search
engine file. The hash is needed to programmatically set the default search
engine.

## Usage

    require 'firefox_hash_generator'
    
    FirefoxHashGenerator.generate(
      :firefox,
      'randombytes.default',
      'DuckDuckGo',
    )

The first argument is the browser app name. This can be retrieved from the
[browser console](https://developer.mozilla.org/en-US/docs/Tools/Browser_Console)
by typing `Services.appinfo.name` for your browser. Note that the input
control is disabled by default and is enabled by setting the `about:config`
pref `devtools.chrome.enabled` to `true`.

The app name can be provided as a string or, for convenience, a symbol that
maps the known browsers to their app names. Currently the following browsers
are known:

- `:firefox`
- `:pale_moon`
- `:waterfox`

The second parameter is the basename of the profile directory. It usually
consists of a randomly generated string followed by the profile name.

The third parameter is the name of the search engine that is being set as the
default one.

The entire process was copied from [this](https://blog.onee3.org/2018/04/manually-add-a-search-engine-to-firefox-quantum/)
amazing guide by Frederick Zhang.

To extract the JSON serialization of the search engine configuration from the
`search.json.mozlz4` file (which contains a proprietary header followed by
the LZ4-compressed JSON), use a utility like [lz4jsoncat](https://github.com/andikleen/lz4json)
or [this Python code](https://gist.github.com/kaefer3000/73febe1eec898cd50ce4de1af79a332a)
(which originated from [this Python code](https://gist.github.com/Tblue/62ff47bef7f894e92ed5)).
For Ruby, a working LZ4 compressor/decompressor is
[extlz4](https://github.com/dearblue/ruby-extlz4).

## Bugs & Patches

Please report via issues and pull requests.

## License

MIT
