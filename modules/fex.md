
# Feature Extraction Module {#feature-extraction-module}

Machine Learning based modules (such as BIO named entity recognition or classification modules) require the encoding of each word to classify as a feature vector. The conversion of words in a sentence to feature vectors, is performed by this module. The features are task-oriented, so they vary depending on what is being classified. For this reason, the encoding is not hard-wired in the code, but dinamically performed interpreting a set of feature rules.

Thus, the Feature Extraction Module converts words in a sentence to feature vectors, using a given set of rules.

The API of this module is the following:

```C++
class fex {
  private:

  public:
    /// constructor, given rule file, lexicon file (may be empty),
    /// and custom functions
    fex(const std::wstring&, const std::wstring&, 
        const std::map<std::wstring,const feature_function *> &);

    /// encode given sentence in features as feature names. 
    void encode_name(const sentence &, std::vector<std::set<std::wstring> > &);
    /// encode given sentence in features as integer feature codes
    void encode_int(const sentence &, std::vector<std::set<int> > &);
    /// encode given sentence in features as integer feature codes and 
    /// as features names
    void encode_all(const sentence &, std::vector<std::set<std::wstring> > &, 
                    std::vector<std::set<int> > &);

    /// encode given sentence in features as feature names. 
    /// Return result suitable for Java/perl APIs
    std::vector<std::list<std::wstring> > encode_name(const sentence &);
    /// encode given sentence in features as integer feature codes.
    /// Return result suitable for Java/perl APIs
    std::vector<std::set<int> > encode_int(const sentence &);

    /// clear lexicon
    void clear_lexicon(); 
    /// encode sentence and add features to current lexicon
    void encode_to_lexicon(const sentence &);
    /// save lexicon to a file, filtering features with low occurrence rate
    void save_lexicon(const std::wstring &, double) const;
};
```

The class may be used to encode a corpus and generate a feature lexicon, or to encode a corpus filtering the obtained features using a previously generated feature lexicon.

The used feature rules must follow the format described in section

5.4.1

. The rules may call custom feature functions, provided the instantianting program provides pointers to call the apropriate code to compute them.

Once the class is instantiated, it can ben used to encode sentences in feature vectors. Features may be obtained as strings (feature names) or integers (feature codes).

The constructor of the class receives a <tt>.rgf</tt> file containing feature extraction rules, a feature lexicon (mapping feature names to integer codes), and a map used to define custom feature functions, with associations between <tt>feature_function</tt> objects and function names (see section

5.4.5

).

If the lexicon file name is empty, features will be assigned an integer code, and the generated lexicon can be saved. This is useful when encoding training corpus and feature codes have not been set yet.

## Feature Extraction Rule File {#feature-extraction-rule-file}

Feature extraction rules are defined in a <tt>.rgf</tt> file. This section describes the format of the file. The syntax of the rules is described in section

5.4.2

Rules are grouped in packages. Begin and end of a package is marked with the keywords `RULES` and `ENDRULES`. Packages are useful to simplify the rules, and to speed up feature computation avoiding computing the same features several times.

A line with format `TAGSET filename` may precede the rule packages definition. The given `filename` will be interpreted as a relative path (based on the <tt>.rgf</tt> location) to a tagset definition file (see section

5.1

) that will be used to obtain short versions of PoS tags. The `TAGSET` line is needed only if the short tag property <tt>t</tt> is used in some rule (see section

5.4.4

below).

The `RULES` package starting keyword must be followed by a condition (see section

5.4.4

).

The rules in a package will onlly be applied to those words matching the package condition, thus avoiding unnecessary tests.

For instance, the rules in the package:

<pre> 
RULES t matches ^NP
 ...
ENDRULES
</pre>

will be applied only for words with a PoS tag (<tt>t</tt>) starting with <tt>NP</tt>. The same result could have been obtained without the package if the same condition was added to each rule, but then, applicability tests for each rule on each word would be needed, resulting in a higher computational cost.

The package condition may be <tt>ALL</tt>. In this case, rules contained in the package will be checked for all words in the sentence. This condition has also an extra effect: the features extracted by rules in this package are cached, in order to avoid repeating computations if a rule uses a window to get features from neighbour words.

For instance, the rule:

<pre> 
RULES ALL
 punct_mark@   [-2,2]   t matches ^F
ENDRULES
</pre>

will generate, for each word, features indicating which words in the surrounding two words (left and right) are punctuation symbols.

With this rule applied to the sentence Hi ! , said John ., the word said would get the features <tt>punct_mark@-1</tt>, <tt>punct_mark@-2</tt>, and <tt>punct_mark@2</tt>. The word John would get the features <tt>punct_mark@-2</tt> and <tt>punct_mark@1</tt>. Since the package has condition <tt>ALL</tt>, the features are computed once per word, and then reused (that is, the fact that the comma is a punctuation sign will be checked only once, regardless of the size of the sentence and the size of the windows in the rules).

## Rule Syntax {#rule-syntax}

Each rule has following syntax:

<pre> feature-name-pattern window condition
</pre>

*   `feature-name-pattern` is a string that describes what the generated feature name will be. Some special characters allow the insertion of variable values in the feature name. See section

    5.4.3

    for a description of the syntax of feature name patterns.
*   `window` is a range in the format `[num,num]`, and states the words around the target word for which the feature has to be computed. A window of `[0,0]` means that the feaure is only checked for the target word.
*   `condition` is the condition that a word has to satisfy in order to get the features extracted by the rule. See section

    5.4.4

    for a description of condition syntax.

## Feature Name Pattern Syntax {#feature-name-pattern-syntax}

Each feature rule has a `feature-name-pattern` that describes how the generated feature name will be.

The following characters are special and are interpreted as variables, and replaced by the corresponding values:

*   Character `@`: will be replaced with the relative position of the matching word with respect to the target word. Thus, the rule `punct_mark@ [-2,2] t matches ^F` will generate a different feature for each word in the window that is a punctuation sign (e.g. <tt>punct_mark@-2</tt> and <tt>punct_mark@1</tt> for the word John in the avobe example).

    But the rule `punct_mark [-2,2] t matches ^F` will generate the same feature for all words in the window that are punctuation signs (e.g. it will generate <tt>punct_mark</tt> twice for the word John in the avobe example). Repeated features are stored only once.

*   Character `$` introduces a variable that must have the format: `$var(position)`.

    Allowed variable names are: `W` (word form, in its original casing), `w` (word form, lowercased), `l` (word lemma), `T` (word full PoS tag), `t` (word short PoS tag), `a` (word lemma+Pos tag). All above variables refer to the analysis selected by the tagger. Variable names may be prefixed with `p` (e.g. `pT`, `pl`, `pa`, etc.) which will generate the feature for all possible analysis of the word, not just the one selected by the tagger.

    The `position)` indicates from which word (relative to the focus word) the value for the variable must be taken.

    For instance, the pattern: `pbig@:$w(0)_$pt(1)` will extract features that will contain the relative position (`@`), plus a bigram made of the word form of the current word in the window (`$w(0)`) plus each possible PoS tag of the word right of it (`$pt(1)`).

    In the sentence John lives here., the features for word here in a window of [-2,0] with the above pattern would be: `pbig@-2:john_VBZ`, `pbig@-2:john_NNS`, `pbig@-1:lives_RB`, and `pbig@0:here_Fp`. Note that there are two features generated for window position -2 because the word lives has two possible PoS tags.

*   Curly brackets <tt>{ }</tt> have two possible interpretations, depending on what they contain:
    1.  If the brackets enclose a regex match variable (e.g $0,$1,$2,...), then they are replaced with the strig matching the corresponding (sub)expression. This only makes sense if the condition of the rule included a regular expression match (see section 

        5.4.4

        ). If it is not the case, results are undefined (probably a segmentation violation).
    2.  If the bracket content is not a regex match variable, then it is interpreted as call to a custom feature function. It must have the format `{functname(position)}`, where `functname` is the name of the function as declared in the custom feature functions map (see section

        5.4.5

        ). The `position` parameter is the relative position to the focus word, and is interpreted in the same way than in the primitive features `$w(position)`, `$t(position)`, etc., described above. E.g., the pattern: `{quoted(-1)}_{quoted(0)}` would generate a feature similar to that of the pattern: `t(-1)_t(0)` but using the result of the custom function `quoted` instead of the PoS tag for the corresponding word.

## Feature Rules Condition Syntax {#feature-rules-condition-syntax}

Conditions control the applicability of a rule or a rule package.

A condition may be <tt>ALL</tt> which is satisfied by any word. A condition may be simple, or compund of several conditions, combined with the logical operadors <tt>AND</tt> and <tt>OR</tt>. The operators in a condition must be homogeneous (i.e. either all of them <tt>AND</tt> or all of them <tt>OR</tt>), mixed conditions are not allowed (note that an OR condition is equivalent to writing two rules that only differ on the condition).

Single conditions consist of a word property, an operation, and an argument. Available word properties are:

*   <tt>W</tt>: Word form, original casing.
*   <tt>w</tt>: Word form, lowercased.
*   <tt>l</tt>: Lemma of the analysis selected by the tagger.
*   <tt>t</tt>: PoS tag (short version) of the analysis selected by the tagger.
*   <tt>T</tt>: PoS tag (full version) of the analysis selected by the tagger.
*   <tt>pl</tt>: List of all possible lemmas for the word.
*   <tt>pt</tt>: List of all possible short PoS tags for the word.
*   <tt>pT</tt>: List of all possible full PoS tags for the word.
*   <tt>na</tt>: Number of analysis of the word.
*   <tt>u.</tt>_i_: _i_-th element of the word <tt>user</tt> field.

Note that all word properties (including <tt>na</tt>) are either strings or lists of strings.

The available primitive operations to build single conditions are the following:

1.  <tt><property> is <string></tt> : String identity.
2.  <tt><property> matches <regexp></tt> : Regex match. If the regex is parenthesized, (sub)expression matches <tt>$0</tt>, <tt>$1</tt>, <tt>$2</tt>, etc. are stored and can be used in the feature name pattern.
3.  <tt><property-list> any_in_set <filename></tt> (or simply <tt>in_set</tt>): True if any property in the list is found in the given file.
4.  <tt><property-list> all_in_set <filename></tt> True if all properties in the list are found in the given file.
5.  <tt><property-list> some_in_set <filename></tt> True if at least two properties in the list are found in the given file.

Operators can be negated with the character <tt>!</tt>. E.g. <tt>!is</tt>, <tt>!matches</tt>, etc.

For file operators expecting lists, the property may be a single string (list of one element).

Some sample valid conditions:

*   `t is NC`   true if the short version of the tag equals <tt>NC</tt>.
*   `T matches ^NC.S..`   true if the long version of the tag matches the given regular expression.
*   `pl in\_set my/data/files/goodlemmas.dat`   true if any possible lemma for the word is found in the given file.
*   `l !in\_set my/data/files/badlemmas.dat`   true if selected lemma for the word is not found in the given file.
*   `w matches ...$`   Always true. Will set the match variable <tt>$0</tt> to the last three characters of the word, so it can be used in the feature name pattern.

## Adding custom feature functions {#adding-custom-feature-functions}

Custom feature functions can be defined, and called from the `.rgf` file enclosed in curly brackets (e.g.: `{quoted(0)}`). Calls to custom feature functions in the `.rgf` file must have one integer parameter, indicating a word position relative to the target word.

Actual code computing custom feature functions must be provided by the caller. the constructor accepts a parameter containig a map `std::map<std::wstring,const feature_function*>`, associating the custom function name used in the rule file with a <tt>feature_function</tt> pointer.

Custom feature functions must be classes derived from class <tt>feature_function</tt>:

```C++
class feature_function {  
    public: 
      virtual void extract (const sentence &s, 
                            int pos, 
                            std::list<std::wstring> &) const=0;
      /// Destructor
      virtual ~feature_function() {};
  };
```

They must implement a method <tt>extract</tt> that receives the sentence, the position of the target word, and a list of strings where the resulting feature name (or names if more than one is to be generated) will be added.

For instance, the example below generates the feature name <tt>in_quotes</tt> when the target word is surrounded by words with the <tt>Fe</tt> PoS tag (which is assigned to any quote symbol by the punctuation module).

```C++
class fquoted : public feature_function {
    public:
      void extract (const sentence &sent, 
                    int i, 
                    std::list<std::wstring> &res) const {
        if ( (i>0 and sent[i-1].get_tag()==L"Fe") and
             (i<(int)sent.size()-1 and sent[i+1].get_tag()==L"Fe") )
          res.push_back(L"in_quotes");
      }
  };
```

We can associate this function with the function name <tt>quoted</tt> adding the pair to a map:

```C++
map<wstring,const feature_function*> myfunctions;
myfunctions.insert(make_pair(L"quoted", (feature_function *) new fquoted()));
```

If we now create a <tt>fex</tt> object passing this map to the constructor, the created instance will call <tt>fquoted::extract</tt> with the appropriate parameters whenever `{quote()}` function is used in a rule in the <tt>.rgf</tt> file.

Note that there are three naming levels for custom feature functions:

*   The name of the feature itself, which will be generated by the extractor and will appear in the feature vectors (`in_quotes` in the above example).
*   The name of the function that will be called from the extraction rules in the <tt>.rgf</tt> file (`quoted` in the above example).
*   The name of the class derived from `feature_function` that has a method `extract` which actually computes the feature (`fquoted` in the above example).
