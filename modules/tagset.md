
# Tag Set Managing Module {#tag-set-managing-module}

This module is able to store information about a tagset, and offers some useful functions on PoS tags and morphological features.

This module is internally used by some analyzers (e.g. probabilities module, HMM tagger, feature extraction, ...) but can be instantiated and called by any user application that requires it.

The API of the module is:

```C++
class tagset {

  public:
    /// constructor: load a tag set description file
    tagset(const std::wstring &f);
    /// destructor
    ~tagset();

    /// get short version of given tag
    std::wstring get_short_tag(const std::wstring &tag) const;

    /// get list of <feature,value> pairs with morphological
    /// information for given tag
    std::list<std::pair<std::wstring,std::wstring> >
              get_msf_features(const std::wstring &tag) const;

    /// get list <feature,value> pairs with morphological 
    /// information, in a string format
    std::wstring get_msf_string(const std::wstring &tag) const;
};
```

The class constructor receives a file name with a tagset description. Format of the file is described below. The class offers two services:

1.  Get the short version of a tag. This is useful for EAGLES tagsets, and required by some modules (e.g. PoS tagger). The length of a short tag depends on the language and part-of-speech, and the criteria to select it is usually to have a tag informative enough (capturing relevant features such as category, subcategory, case, etc) but also general enough so that significative statistics for PoS tagging can be acquired from reasonably-sized corpora.
2.  Decompose a tag into a list of pairs feature-value (e.g. <tt>gender=masc</tt>, <tt>num=plural</tt>, <tt>case=dative</tt>, etc). This can be retrieved as a list of string pairs, or as a formatted string.


## Tagset Description File {#tagset-description-file}

Tagset description file has two sections: `<DecompositionRules>` and `<DirectTranslations>`, which describe how tags are converted to their short version and decomposed into morphological feature-value pairs

*   Section `<DirectTranslations>` describes a direct mapping from a tag to its short version and to its feature-value pair list. Each line in the section corresponds to a tag, and has the format: `tag short-tag feature-value-pairs`

    For instance the line: `NCMS000 NC postype=common|gender=masc|number=sg` states that the tag `NCMS000` is shortened as `NC` and that its list of feature-value pairs is the one specified.

    This section has precedence over section `<DecompositionRules>`, and can be used as an exception list. If a tag is found in section `<DirectTranslations>`, the rule is applied and any rule in section `<DecompositionRules>` for this tag is ignored.

*   Section `<DecompositionRules>` encodes rules to compute the morphological features from an EAGLES tag digits. The form of each line is:

    <pre>tag short-tag-size digit-description-1 digit-description-2 ...
    </pre>

    where `tag` is the digit for the category in the EAGLES PoS tag (i.e. the first digit: `N`, `V`, `A`, etc.), and `short-tag-size` is an integer stating the length of the short version of the tag (e.g. if the value is 2, the first two digits of the EAGLES PoS tag will we used as short version). Finally, fields `digit-description-n` contain information on how to interpret each digit in the EAGLES PoS tag

    There should be as many `digit-description` fields as digits there are in the PoS tag for that category. Each `digit-description` field has the format: `feature/digit:value;digit:value;digit:value;...` That is: the name of the feature encoded by that digit, followed by a slash, and then a semicolon-separated list of translation pairs that, for each possible digit in that position give the feature value.

    For instance, the rule for Spanish noun PoS tags is (in a single line): `N 2 postype/C:common;P:proper gen/F:f;M:m;C:c num/S:s;P:p;N:c` `neclass/S:person;G:location;O:organization;V:other` `grade/A:augmentative;D:diminutive` and states that any tag starting with <tt>N</tt> (unless it is found in section `<DirectTranslations>`) will be shortened using its two first digits (e.g. <tt>NC</tt>, or <tt>NP</tt>). Then, the description of each digit in the tag follows, encoding the information:

    1.  <tt>postype/C:common;P:proper</tt> - second digit is the subcategory (feature <tt>postype</tt>) and its possible values are <tt>C</tt> (translated as <tt>common</tt>) and <tt>P</tt> (translated as <tt>proper</tt>).
    2.  <tt>gen/F:f;M:m;C:c</tt> - third digit is the gender (feature <tt>gen</tt>) and its possible values are <tt>F</tt> (feminine, translated as <tt>f</tt>), <tt>M</tt> (masculine, translated as <tt>m</tt>), and <tt>C</tt> (common/invariable, translated as <tt>c</tt>).
    3.  <tt>num/S:s;P:p;N:c</tt> - fourth digit is the number (feature <tt>num</tt>) and its possible values are <tt>S</tt> (singular, translated as <tt>s</tt>), <tt>P</tt> (plural, translated as <tt>p</tt>), and <tt>C</tt> (common/invariable, translated as <tt>c</tt>).
    4.  <tt>neclass/S:person;G:location;O:organization;V:other</tt> - Fifth digit is the semantic class for proper nouns (feature <tt>neclass</tt>), with possible values <tt>S</tt> (translated as <tt>person</tt>), <tt>G</tt> (translated as <tt>location</tt>), <tt>O</tt> (translated as <tt>organization</tt>), and <tt>V</tt> (translated as <tt>other</tt>).
    5.  <tt>grade/A:augmentative;D:diminutive</tt> - sixth digit is the grade (feature <tt>grade</tt>) with possible values <tt>A</tt> (translated as <tt>augmentative</tt>), and <tt>D</tt> (translated as <tt>diminutive</tt>).

    If a feature is underspecified or not appliable, a zero (<tt>0</tt>) is expected in the appropriate position of the PoS tag.

    With the example rule described above, the tag translations in table

    5.1.1

    would take place:

**Table 5.1:** Example results for tagset managing module.

| **Illegal nested table :** EAGLES PoS tag short version morphological features NCMS00 NC postype=common|gen=m|num=s NCFC00 NC postype=common|gen=f|num=c NCFP0A NC postype=common|gen=f|num=p|grade=augmentative NP0000 NP postype=proper NP00G0 NP postype=proper|neclass=location |
| --- |
