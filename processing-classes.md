# Language Processing Modules {#language-processing-modules}

This chapter describes each of the modules in FreeLing. For each module, its public API is described, as well as its main configuration options. Most modules can be customized via a configuration file.

A typical module receives a list of sentences, and enriches them with new linguistic information (morphological analysis, disambiguation, parsing, etc.)

Usually, when the module is instantiated, it receives as a parameter the name of a file where the data and/or parameters needed by the module are stored (e.g. a dictionary file for the dictionary search module, or a CFG grammar for a parser module).

Most modules are language-independent, that is, if the provided file contains data for another language, the same module will be able to process that language.

All modules are thread-safe (though some such as the sentence splitter need a session identifier token to ensure this safety).

If an application needs to process more than one language, it can instantiate the needed modules for each language simply calling the constructors with different data files as a parameter.

# Language Identifier Module {#language-identifier-module}

This module is somehow different of the other modules, since it doesn't enrich the given text. It compares the given text with available models for different languages, and returns the most likely language the text is written in. It can be used as a preprocess to determine which data files are to be used to analyze the text.

The API of the language identifier is the following:

```C++
class lang_ident {
  public:
    /// Build an empty language identifier.
    lang_ident();

    /// Build a language identifier, read options from given file.
    lang_ident(const std::wstring &cfgfile);

    /// load given language from given model file, add to existing languages.
    void add_language(const std::wstring &modelfile);
    
    /// train a n-gram model of given order for language 'code', 
    /// store in modelFile, and add it to the known languages list.
    void train_language(const std::wstring &textfile, 
                        const std::wstring &modelfile, 
                        const std::wstring &code, size_t order);

    /// Classify the input text and return the code of the best language among
    /// those in given set. If set is empty all known languages are considered.
    /// If no language reaches the threshold,  "none" is returned
    std::wstring identify_language (
                   const std::wstring&, 
                   const std::set<std::wstring> &ls) const; 
                   
    /// Classify the input text and return the code and perplexity for 
    /// each language in given set. If set is empty, all known languages 
    /// are considered.
    void rank_languages (
               std::vector<std::pair<double,std::wstring> > &result, 
               const std::wstring &text,
               const std::set<std::wstring> &ls) const;


};
```

Once created, the language identifier may be used to get the most likely language of a text using the method `identify_language`, or to return a sorted vector of probabilities for each language (`rank_languages`). In both cases, a set of languages to be considered may be supplied, telling the identifier to apply to the input text only models for those languages in the list. An empty list is interpreted as *use all available language models*. The language list parameter is optional in both identification methods, and defaults to the empty list.

The same `lang_ident` class may be used to train models for new languages. A plain text file can be passed to method `train_language` which will use the data to create a new model, which will enlarge the identifier's language repertoire, and will be stored for its use in future instances of the class.

The constructor expects a configuration file name, containing information about where are the language models located, and some parameters. The contents of that file are described below.

## Language Identifier Options File {#language-identifier-options-file}

The language identifier options file has a unique section `<Languages>` closed by tag `</Languages>`.

Section `<Languages>` contains a list of filenames, one per line. Each filename contains a language model (generated with the `train_language` method). The filenames may be absolute or relative. If relative, they are considered to be relative to the location of the identifier options file.

An example of a language identifier option file is:

```XML
<Languages>
./es.dat
./ca.dat
./it.dat
./pt.dat
</Languages>
```

# Tokenizer Module {#tokenizer-module}

The first module in the processing chain is the tokenizer. It converts plain text to a vector of <tt>word</tt> objects, according to a set of tokenization rules.

Tokenization rules are regular expressions that are matched against the beggining of the text line being processed. The first matching rule found is used to extract the token, the matching substring is deleted from the line, and the process is repeated until the line is empty.

The API of the tokenizer module is the following:

```C++
class tokenizer {
  public:
    /// Constructor
    tokenizer(const std::wstring &cfgfile);

    /// tokenize string, leave result in lw
    void tokenize(const std::wstring &text, 
                  std::list<word> &lw) const;

   /// tokenize string, return result as list
    std::list<word> tokenize(const std::wstring &text) const;

    /// tokenize string, updating byte offset. Leave results in lw.
    void tokenize(const std::wstring &text, 
                  unsigned long &offset, 
                  std::list<word> &lw) const;

    /// tokenize string, updating offset, return result as list
    std::list<word> tokenize(const std::wstring &text, 
                             unsigned long &offset) const;
};
```

That is, once created, the tokenizer module receives plain text in a string, tokenizes it, and returns a list of <tt>word</tt> objects corresponding to the created tokens

## Tokenizer Rules File {#tokenizer-rules-file}

The tokenizer rules file is divided in three sections `<Macros>`, `<RegExps>` and `<Abbreviations>`. Each section is closed by `</Macros>`, `</RegExps>` and `</Abbreviations>` tags respectively.

The `<Macros>` section allows the user to define regexp macros that will be used later in the rules. Macros are defined with a name and a POSIX regexp. E.g.:  
`MYALPHA [A-Za-z]`  
`ALPHA [[:alpha:]]`

The `<RegExps>` section defines the tokenization rules. Previously defined macros may be referred to with their name in curly brackets. E.g.:  
`*ABREVIATIONS1 0 ((\{ALPHA\}+\.)+)(?!\.\.)`

Rules are regular expressions, and are applied in the order of definition. The first rule matching the beginning of the line is applied, a token is built, and the rest of the rules are ignored. The process is repeated until the line has been completely processed.

The format of each rule is:

*   The first field in the rule is the rule name. If it starts with a <tt>*</tt>, the RegExp will only produce a token if the match is found in the abbreviation list (`<Abbreviations>` section). Apart from that, the rule name is only for informative/readability purposes.
*   The second field in the rule is the substring to form the token/s with. It may be 0 (the match of the whole expression) or any number from 1 to the number of subexpression (up to 9). A token will be created for each subexpression from 1 to the specified value.
*   The third field is the regexp to match against the input. line. Any POSIX regexp convention may be used.
*   An optional fourth field may be added, containing the string <tt>CI</tt> (standing for Case Insensitive). In this case, the input text will be matched case-insensitively against the regexp. If the fourth field is not present, or it is different than <tt>CI</tt>, the rule is matched case-sensitively.

The `<Abbreviations>` section defines common abbreviations (one per line) that must not be separated of their following dot (e.g. <tt>etc.</tt>, <tt>mrs.</tt>). They must be lowercased, even if they are expected to appear uppercased in the text.

# Splitter Module {#splitter-module}

The splitter module receives lists of <tt>word</tt> objects (either produced by the tokenizer or by any other means in the calling application) and buffers them until a sentence boundary is detected. Then, a list of <tt>sentence</tt> objects is returned.

The buffer of the splitter may retain part of the tokens if the given list didn't end with a clear sentence boundary. The caller application can submit further token lists to be added, or request the splitter to flush the buffer.

In order to be thread-safe, the splitter needs to keep different internal buffers for different threads (or for the same thread, if it uses the same splitter to split two different text sources alternatively). Thus, the calling application must open a splitting session to obtain an id, that will identify the internal buffer to use.

In addition, each session will have its own sentence-id counter, so sentences processed in the same session are assigned correlative sentence-ids (starting at 1).

The API for the splitter class is:

```C++
class splitter {
  public:
    /// Constructor. Receives a file with the desired options
    splitter(const std::wstring &cfgfile);

    /// Destructor
    ~splitter();

    /// splitter::session_id is the type to store session ids
    typedef int session_id;

    /// open a splitting session, get session id
    session_id open_session();

    /// close splitting session
    void close_session(session_id ses);

    /// Add given list of words to the buffer, and put complete sentences 
    /// that can be build into ls.
    /// The boolean states if a buffer flush has to be forced (true) or
    /// some words may remain in the buffer (false) if the splitter 
    /// needs to wait to see what is coming next.
    /// Each thread using the same splitter needs to open a new session.
    void split(session_id ses, 
               const std::list<word> &lw, 
               bool flush, 
               std::list<sentence> &ls);

    /// same than previous method, but result sentences are returned.
    std::list<sentence> split(session_id ses, 
                              const std::list<word> &lw, 
                              bool flush);

};
```

## Splitter Options File {#splitter-options-file}

The splitter options file contains four sections: `<General>`, `<SentenceEnd>`, `<SentenceStart>`, and `<Markers>`.

The `<General>` section contains general options for the splitter: Namely, <tt>AllowBetweenMarkers</tt> and <tt>MaxWords</tt> options. The former may take values 1 or 0 (on/off). The later may be any integer. An example of the `<General>` section is:

```XML
<General>
AllowBetweenMarkers 0
MaxWords 0
</General>
```

If <tt>AllowBetweenMarkers</tt> is off (<tt>0</tt>), a sentence split will never be introduced inside a pair of parenthesis-like markers, which is useful to prevent splitting in sentences such as *"I hate --Mary said. Angryly.-- apple pie"*. If this option is on (<tt>1</tt>), sentence splits will be introduced as if they had happened outside the markers.

The value for <tt>MaxWords</tt> states how many words are processed before forcing a sentence split inside parenthesis-like markers (this option is intended to avoid memory fillups in case the markers are not properly closed in the text).  
A value of zero means *Never split, I'll risk to a memory fillup*. This option is less aggressive than unconditionally activating <tt>AllowBetweenMarkers</tt>, since it will introduce a sentence split between markers only after a sentence of length <tt>MaxWords</tt> has been accumulated. Setting <tt>MaxWords</tt> to a large value will prevent memory fillups, while keeping at a minimum the splittings inside markers.

The `<Markers>` section lists the pairs of characters (or character groups) that have to be considered open-close markers. For instance:  
```XML
<Markers>
 " "
 ( )
 { }
 /* */
 </Markers>
```

The `<SentenceEnd>` section lists which characters are considered as possible sentence endings. Each character is followed by a binary value stating whether the character is an unambiguous sentence ending or not. For instance, in the following example, `?` is an unambiguous sentence marker, so a sentence split will be introduced unconditionally after each `?`. The other two characters are not unambiguous, so a sentence split will only be introduced if they are followed by a capitalized word or a sentence start character.

```XML
<SentenceEnd>
 . 0
 ? 1
 ! 0
 </SentenceEnd>
```

The `<SentenceStart>` section lists characters known to appear only at sentence beggining. For instance, open question/exclamation marks in Spanish:

```XML
<SentenceStart>
 ? 
 !
 </SentenceStart>
```

# Morphological Analyzer Module {#morphological-analyzer-module}

The morphological analyzer is a meta-module which does not perform any processing of its own.

It is just a convenience module to simplify the instantiation and call to the submodules described in the next sections.

At instantiation time, it receives a `maco_options` object, containing information about which submodules have to be created and which files must be used to create them.

Any submodule loaded at instantiation time, may be deactivated/reactivated later using the method `maco::set_active_options` described above. Note that a submodule that was not loaded when creating a `maco` instance, can neither be loaded nor activated later.

A calling application may bypass this module and just call directly the submodules.

The Morphological Analyzer API is:

```C++ 
class maco {
  public:
    /// Constructor. Receives a set of options.
    maco(const maco_options &); 

    /// change active options for further analysis
    void set_active_options(bool umap, bool num, bool pun, bool dat,
                            bool dic, bool aff, bool comp, bool rtk,
                            bool mw, bool ner, bool qt, bool prb);

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The `maco_options` class has the following API:

```C++
class maco_options {
  public:
    // Language analyzed
    std::wstring Lang;

    /// Morphological analyzer modules configuration/data files.
    std::wstring LocutionsFile, QuantitiesFile, AffixFile, 
      CompoundFile, DictionaryFile, ProbabilityFile, NPdataFile, 
      PunctuationFile, UserMapFile;

    /// module-specific parameters for number recognition
    std::wstring Decimal, Thousand;

    /// module-specific parameters for probabilities
    double ProbabilityThreshold;

    /// module-specific parameters for dictionary
    bool InverseDict,RetokContractions;

    /// constructor
    maco_options(const std::wstring &); 

    /// Option setting methods provided to ease perl interface generation. 
    /// Since option data members are public and can be accessed directly
    /// from C++, the following methods are not necessary, but may become
    /// convenient sometimes.
    void set_data_files(const std::wstring &usr,
                        const std::wstring &pun, const std::wstring &dic,
                        const std::wstring &aff, const std::wstring &comp,
                        const std::wstring &loc, const std::wstring &nps,
                        const std::wstring &qty, const std::wstring &prb);
    void set_nummerical_points(const std::wstring &dec, const std::wstring &tho);
    void set_threshold(double);
    void set_inverse_dict(bool);
    void set_retok_contractions(bool);
  };
```

To instantiate a Morphological Analyzer object, the calling application needs to create an instance of `maco_options`, initialize its fields with the desired values, and use it to call the constructor of the `maco` class.

Each possible submodule will be created and loaded if the given file is different than the empty string. The created object will create the required submodules, and when asked to <tt>analyze</tt> some sentences, it will just pass it down to each submodule, and return the final result.

Class `maco_options` has convenience methods to set the values of the options, but note that all the members are public, so the user application can set those values directly if preferred.

# Number Detection Module {#number-detection-module}

The number detection module is language dependent: It recognizes nummerical expression (e.g.: <tt>1,220.54</tt> or <tt>two-hundred sixty-five</tt>), and assigns them a normalized value as lemma.

The module is basically an Augmented Transition Network (ATN) that recognizes valid nummerical expressions. Since the structure of the automata and the actions to compute the actual nummerical value are different for each lemma, the ATN is coded in C++ and has to be rewritten for any new language.

For languages that do not have an implementation of a specific automata, a generic module is used to recognize number-like expressions that contain nummerical digits.

There is no configuration file to be provided to the class when it is instantiated.

The API of the class is:

```C++  
class numbers {
  public:
    /// Constructor: receives the language code, and the decimal 
    /// and thousand point symbols
    numbers(const std::string &lang, 
            const std::string &dec, 
            const std::string &thou); 

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

Parameters expected by the constructor are:

*   The language code: used to decide whether the generic recognizer or a language-specific module is used.
*   The decimal point symbol.
*   The thousand point sympol.

The last two parameters are needed because in some latin languages, the comma is used as decimal point separator, and the dot as thousand mark, while in languages like English it is the other way round. These parameters make it possible to specify what character is to be expected at each of these positions. They will usually be comma and dot, but any character could be used.

# Punctuation Detection Module {#punctuation-detection-module}

The punctuation detection module assigns Part-of-Speech tags to punctuation symbols. The API of the class is the following:

```C++  
class punts {
  public:
    /// Constructor: load punctuation symbols and tags from given file
    punts(const std::string &cfgfile); 

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor receives as parameter the name of a file containing the list of the PoS tags to be assigned to each punctuation symbol.

Note that this module will be applied afer the tokenizer, so, it will only annotate symbols that have been separated at the tokenization step. For instance, if you include the three suspensive dots (...) as a single punctuation symbol, it will have no effect unless the tokenizer has a rule that causes these substring to be tokenized in one piece.

## Punctuation Tags File {#punctuation-tags-file}

The format of the file listing the PoS for punctuation symbols is one punctuation symbol per line, each line with the format: <tt>punctuation-symbol lemma tag</tt>. E.g.:

```
! ! Fat
, , Fc
: : Fd
... ... Fs
```

One special line may be included defining the tag that will be assigned to any other punctuation symbol not found in the list. Any token containing no alphanumeric character is considered a punctuation symbol. This special line has the format: `<Other> tag`.  
E.g.:  
`<Other> Fz`

# User Map Module {#user-map-module}

The user map module assigns Part-of-Speech tags to words matching a given regular expression. It can be used to customize the behaviour of the analysis chain to specific applications, or to process domain-specific special tokens.

If used, it should be run before the other modules (e.g. morphological analysis) to prevent them from guessing possible PoS tags for special tokens.

The API of the class is the following:

```C++  
class RE_map {
  public:
    /// Constructor, load special token patterns
    RE_map(const std::wstring &cfgfile); 

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor receives as parameter the name of a file containing a list of regular expressions, and the list of pairs lemma-PoS tag to be assigned to each word matching the expression.

Note that this module will be applied afer the tokenizer, so, it will only annotate symbols that have been separated at the tokenization step. So, customizing your application to recognize certain special tokens may require modifying also the tokenizer configuration file.

Note also that if you introduce in this file PoS-tags which are not in the tagset known to the tagger, it may not be able to properly disambiguate the tag sequence.

Finally, note that this module sequentially checks each regular expression in the list against each word in the text. Thus, it should be used for patterns (not for fixed strings, which can be included in a dictionary file), and with moderation: using a very long list of expressions may severely slow down your analysis chain.

## User Map File {#user-map-file}

The format of the file containing the user map from regular expression to pairs lemma-PoS is one regular expression per line, each line with the format: <tt>regex lemma1 tag1 lemma2 tag2 ...</tt>.

The lemma may be any string literal, or <tt>\$\$</tt> meaning that the string matching the regular expression is to be used as a lemma. E.g.:  
```  
@[a-z][0-9] $ NP00000
<.*> XMLTAG Fz
hulabee hulaboo JJS hulaboo NNS
```

The first rule will recognize tokens such as `@john` or `@peter4`, and assign them the tag `NP00000` (proper noun) and the matching string as lemma.

The second rule will recognize tokens starting with `<` and ending with `>` (such as `<HTML>` or `<br/>`) and assign them the literal `XMLTAG` as lemma and the tag `Fz` (punctuation:others) as PoS.

The third rule will assign the two pairs lemma-tag to each occurrence of the word *hulabee*. This is just an example, and if you want to add a word to your dictionary, the dictionary module is the right place to do so.

# Dates Detection Module {#dates-detection-module}

The dates detection module, as the number detection module, is a collection of language-specific Augmented Transition Networks, and for this reason needs no data file to be provided at instantiation time.

For languages that do not have a specific ATN, a default analyzer is used that detects simple date patterns (e.g. <tt>DD-MM-AAAA</tt>, <tt>MM/DD/AAAA</tt>, etc.)

The API of the class is:

```C++        
class dates {             
  public:   
    /// Constructor: receives the language code
    dates(const std::string &lang); 

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The only parameter expected by the constructor is the language of the text to analyze, in order to be able to apply the appropriate specific automata, or select the default one if none is available.

# Dictionary Search Module {#dictionary-search-module}

The dictionary search module has two functions: Search the word forms in the dictionary to find out their lemmas and PoS tags, and apply affixation or compounding rules to find the same information in the cases in which the form is a derived form not included in the dictionary (e.g. the word *quickly* may not be in the dictionary, but a suffixation rule may state that removing suffix *-ly* and searching for the obtained adjective is a valid way to form and adverb).

The decision of what is included in the dictionary and what is dealt with through affixation rules is left to the linguist building the linguistic data resources.

The API for this module is the following:   
```C++
class dictionary {
  public:
    /// Constructor
    dictionary(const std::wstring &Lang, const std::wstring &dicFile, 
               const std::wstring &sufFile, const std::wstring &compFile,
               bool invDic=false, bool retok=true);

    /// Destructor
    ~dictionary();

    /// add analysis to dictionary entry (create entry if not there)
    void add_analysis(const std::wstring &form, const analysis &an);

    /// remove entry from dictionary
    void remove_entry(const std::wstring &form);

    /// customize behaviour of dictionary for further analysis
    void set_retokenize_contractions(bool b); 
    void set_affix_analysis(bool b);
    void set_compound_analysis(bool b);

    /// find out whether the dictionary has loaded an affix or compounds module
    bool has_affixes() const;
    bool has_compounds() const;

    /// Get dictionary entry for a given form, add to given list.
    void search_form(const std::wstring &form, std::list<analysis> &la) const;

    /// Fills the analysis list of a word, checking for suffixes and contractions.
    /// Returns true iff the form is a contraction, returns contraction components
    /// in given list
    bool annotate_word(word &w, std::list<word> &lw, bool override=false) const;

    /// Fills the analysis list of a word, checking for suffixes and contractions.
    /// Never retokenizing contractions, nor returning component list.
    /// It is just a convenience equivalent to "annotate_word(w,dummy,true)"
    void annotate_word(word &w) const;

    /// Get possible forms for a lemma+pos (requires inverseDict=true
    /// when module was instantiated)
    std::list<std::wstring> get_forms(const std::wstring &lemma, 
                                      const std::wstring &pos) const;

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &ls) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The parameters of the constructor are:

*   The language of the processed text. This is required by the affixation submodule to properly handle graphical accent rules in latin languages.
*   The dictionary file name. See below for details.
*   The affixation rules file name (an empty string means no affix analysis is to be performed). 
*   The compound rules file name (an empty string means no compound analysis is to be performed). 
*   An optional boolean (default: false) stating whether the dictionary must be created with inverse access, to enable the use of `get_forms` to obtain a word form given a lemma+PoS pair.
*   An optional boolean (default: true) stating whether the contractions found in the dictionary must be retokenized right away, or left for later modules to decide.

The dictionary content may be updated online using the methods `add_analysis` and `remove_entry`. Notice that this will modify the dictionary instance in RAM, but not the file in the disk. If you want your changes to be permanent, modify the dictionary file instead.

The dictionary module behaviour may be tuned on-the-fly with the methods `set_affix_analysis`, `set_retokenize_contractions`, and `set_compound_analysis`, which will activate (when parameter is <tt>true</tt>) or deactivate (when <tt>false</tt>) the specified feature for any further call to the `analyze` methods.

## Form Dictionary File {#form-dictionary-file}

The form dictionary contais two required sections: `<IndexType>` and `<Entries>`

Section `<IndexType>` contains a single line, that may be either `DB_PREFTREE` or `DB_MAP`. With `DB_MAP` the dictionary is stored in a C++ STL <tt>map</tt> container. With `DB_PREFTREE` it is stored in a prefix-tree structure. Depending on the size of the dictionary and on the morphological variation of the language, one structure may yield slightly better access times than the other.

Section `<Entries>` contains lines with one form per line. Each form line has format: <tt>form lemma1 PoS1 lemma2 PoS2 ...</tt>. E.g.:

```
casa casa NCFS000 casar VMIP3S0 casar VMM02S0
backs back NNS back VBZ
```

Lines corresponding to words that are contractions may have an alternative format if the contraction is to be splitted. The format is <tt>form form1+form2+... PoS1+PoS2+...</tt> where <tt>form1,form2,...</tt> are the forms (not the lemmas) of the contracted words. For instance:  
`del de+el SP+DA`

This line expresses that whenever the form *del* is found, it is replaced with two words: *de* and *el*. Each of the new two word forms are searched in the dictionary, and assigned any tag matching their correspondig tag in the third field. So, *de* will be assigned all tags starting with <tt>SP</tt> that this entry may have in the dictionary, and *el* will get any tag starting with <tt>DA</tt>.

Note that a contraction included in the dictionary cannot be splitted in two different ways corresponding to different forms (e.g. <tt>he's = he+is | he+has</tt>), so only a combination of forms and a combination of tags may appear in the dictionary.
That is, the dictionary entry:  
`he's he+is PRP+VB he+has PRP+VB`  
is invalid because it states two different forms for *'s*, while the entry:  
`he's he+'s PRP+VB`  
is valid because it only states a form (*'s*) that will get two lemmas (*be* and *have*) when looked up in the dictionary.

Also, a set of tags may be specified for a given form, e.g.:  
`he'd he+'d PRP+VB/MD`

This will produce two words: *he* with <tt>PRP</tt> analysis, and *'d* with its analysis matching any of the two given tags (i.e. <tt>have_VBZ</tt> and <tt>would_MD</tt>). Note that this will work only if the form 'd is found in the dictionary with those possible analysis.

If all tags for one of the new forms are to be used, a wildcard may be written as a tag. e.g.: `pal para+el SP+*`

This will replace pal with two words, para with only its <tt>SP</tt> analysis, plus el with all its possible tags.

The contraction entries in the dictionary are intended for inambiguous contractions, or for cases such that it is not worth (or it is too difficult) to handle otherwise. For splitting more sophisticated compound words, such as verb clitic pronouns in Spanish or Italian (e.g dale → dar+él), derivation (e.g. _quick → quickly_, rápida → rápidamente), diminutive/augmentative sufixes, prefixes, or other similar behaviours, the affixation module should be used.

An optional parameter in the constructor enables to control whether contractions are splitted by the dictionary module itself (thus passing two words instead of one to later modules) or the decision is left to later modules (which will receive a single word carrying retokenization information).

## Affixation Rules File {#affixation-rules-file}

The submodule of the dictionary handler that deals with affixes requires a set of affixation rules.

The file consists of two (optional) sections: `<Suffixes>` and `<Prefixes>`. The first one contains suffixation rules, and the second, prefixation rules. They may appear in any order.

Both kinds of rules have the same format, and only differ in whether the affix is checked at the beggining or at the end of the word.

Each rule has to be written in a different line, and has 10 fields:

1.  Affix to erase form word form (e.g: _crucecita - cecita = cru_)
2.  Affix (`*` for emtpy string) to add to the resulting root to rebuild the lemma that must be searched in dictionary (e.g. _cru + z = cruz_)
3.  Condition on the tag of found dictionary entry (e.g. _cruz_ has tag <tt>NCFS</tt> in the dictionary). The condition is a perl RegExp
4.  Tag for suffixed word (`*` = keep tag in dictionary entry)
5.  Check lemma adding accents
6.  Enclitic suffix (special accent behaviour in Spanish)
7.  Prevent later modules (e.g. probabilities) from assigning additional tags to the word
8.  Lemma to assign: Any combination of: <tt>F</tt>, <tt>R</tt>, <tt>L</tt>, <tt>A</tt>, or a string literal separated with a <tt>+</tt> sign. For instance: <tt>R+A</tt>, <tt>A+L</tt>, <tt>R+mente</tt>, etc.

    <tt>F</tt> stands for the original form (before affix removal, e.g. _crucecitas_), <tt>R</tt> stands for root found in dictionary (after affix removal and root reconstruction, e.g. _cruces_), <tt>L</tt> stands for lemma in matching dictionary entry (e.g. _cruz_), <tt>A</tt> stands for the affix that the rule removed

9.  Try the affix always, not only for unknown words.
10.  Retokenization info, explained below (```-`'' for none)

Example of prefix rule `anti * ^NC AQ0CN0 0 0 1 A+L 0 -`

This prefix rule states that <tt>anti</tt> should be removed from the beggining of the word, nothing (<tt>*</tt>) should be added, and the resulting root should be found in the dictionary with a NC PoS tag. If that is satisfied, the word will receive the <tt>AQ0CN0</tt> tag and its lemma will be set to the affix (<tt>anti</tt>) plus the lemma of the root found in the dictionary. For instance, the word <tt>antimisiles</tt> would match this rule: <tt>misiles</tt> would be found in the dictionary with lema <tt>misil</tt> and PoS <tt>NCMP000</tt>. Then, the word will be assigned the lemma <tt>antimisil</tt> (<tt>A+L = anti+misil</tt>) and the tag AQ0CN0.

Examples of sufix rules `cecita z|za ^NCFS NCFS00A 0 0 1 L 0 -` `les * ^V * 0 1 0 L 1 $$+les:$$+PP`

The first suffix rule above (<tt>cecita</tt>) states a suffix rule that will be applied to unknown words, to see whether a valid feminine singular noun is obtained when substituting the suffix <tt>cecita</tt> with <tt>z</tt> ot <tt>za</tt>. This is the case of <tt>crucecita</tt> (diminutive of <tt>cruz</tt>). If such a base form is found, the original word is analyzed as diminutive suffixed form. No retokenization is performed.

The second rule (<tt>les</tt>) applies to all words and tries to check whether a valid verb form is obtained when removing the suffix <tt>les</tt>. This is the case of words such as <tt>viles</tt> (which may mean I saw them, but also is the plural of the adjective <tt>vil</tt>).

In this case, the retokenization info states that if eventually the verb tag is selected for this word, it may be retokenized in two words: The base verb form (referred to as <tt>$</tt>, <tt>vi</tt> in the example) plus the word <tt>les</tt>. The tags for these new words are expressed after the colon: The base form must keep its PoS tag (this is what the second <tt>$</tt> means) and the second word may take any tag starting with PP it may have in the dictionary. Prefixing a tag in the retokenization information with a ``<tt>!</tt>'' sign will assign that tag withour performing any dictionary check. (E.g. if the rule was `$$+les:$$+!XYZ`, the word <tt>les</tt> would get the tag <tt>XYZ</tt> regardless of whether either the word or the tag are found in the dictionary.

So, for word <tt>viles</tt>, we would obtain its adjective analysis from the dictionary, plus its verb + clitic pronoun from the suffix rule: `viles vil AQ0CP0 ver+les VMIS1S0+PP3CD00`

The second analysis will carry the retokenization information, so if eventually the PoS tagger selects the <tt>VMI</tt> analysis (and the TaggerRetokenize option is set), the word will be retokenized into:

<pre>   vi ver VMIS1S0
   les ellos PP3CPD00
</pre>

## Compound rules file {#compound-rules-file}

The dictionary may be configured to check whether a word is a compound formed by the concatenation of several dictionary words.

The compounds will be detected if they are formed strictly by words in the dictionary, either glued toghether (e.g. ghostbusters,underworld), or separated with a character especified to be a compound joint (e.g. a dash middle-aged). In the current version, if a component of the compound is a form derived via affixation (e.g. extremely-complex) it will not be detected, even if the base form (extreme) is in the dictionary.

The submodule of the dictionary handler that deals with compounds requires a set of valid compound patterns. The configuration file for the compound detection module consists of three sections: `<UnknownWordsOnly>`, `<JoinChars>`, and `<CompoundPatterns>`.

Section `<UnknownWordsOnly>` is optional, and contains just one line with either `yes` or `no`. Default is `yes`, meaning that only words not found in the dictionary or solved by the affixation module will be tried as potential compounds. If the option is set to `no`, all words will be tried as potential compounds (probably overgenerating wrong analysis).

Section `<JoinChars>` contains a list of characters to be considered compound joints. A typical member of this list is the dash ``-'', though the list may vary from one language to another. The character list must be specified with one character per line.

Section `<CompoundPatterns>` contains a list of valid compound patterns. Each pattern must be defined in a separate line.

There are two possible formats for specifying a pattern:

*   `headed_PoS_pattern` This pattern consists of a sequence of PoS tag prefixes separated by underscores. Exactly one of the tags must be preceeded with a plus sign (`+`) that indicates it is the head of the compound, and thus its PoS tag will be used as the tag of the compound.

    For instance, the pattern `JJ_+NN` will recognize a compound such as lightweight or lightweights, since their components match the categories in the pattern. The compound will receive the PoS tag of the second component, producing the analyses (light_weight,NN) and (light_weight,NNS) respectively.

*   `PoS_pattern compound_PoS` Patterns specified in this way behave like described above, but no head marker is expected in the `PoS_pattern`. Instead of using the head PoS, the PoS tag for the compound is straightforwardly set to the value of `compound_PoS`.

For flexibility, in any of both rule formats, a wildcard `*` may be used instead of a PoS prefix, causing that part of the pattern to match any PoS tag.

## Dictionary Management {#dictionary-management}

In many NLP applications you want to deal with text in a particular domain, which contain words or expressions (terminology, proper nouns, etc.) that are specific or have a particular meaning in that domain.

Thus, you may want to extend you dictionary to include such words. There are two main ways of doing this:

*   Extend your dictionary: Dictionaries are created at installation time from sources in the directory <tt>data/XX/dictionary</tt> (where XX is the language code). Those files contain one triplet word-lemma-tag per line, and are fused in a single dictionary at installation time.

    The script in <tt>src/utilities/dicc-management/bin/build-dict.sh</tt> will read the given files and build a dictionary with all them.

    <sup><span class="arabic">4</span>.<span class="arabic">1</span></sup>

    Thus, if you have a domain dictionary with a list of triplets word-lemma-tag, you can build a new dictionary fusing the original FreeLing entries with your domain entries. The resulting file can be given to the constructor of the dictionary class.

*   Instantiate more than one dictionary module: Another option is to instatiate several dictionary modules (creating each one with a different dictionary file), and run the text through each of them sequentially. When the word is found in one dictionary along the chain, the following dictionary modules will ignore it and will not attempt to look it up.

# Multiword Recognition Module {#multiword-recognition-module}

This module aggregates input tokens in a single word object if they are found in a given list of multiwords.

The API for this class is:

```C++
class locutions: public automat {
  public:
    /// Constructor, receives the name of the file
    /// containing the multiwords to recognize.
    locutions(const std::string &cfgfile);

    /// Detect multiwords starting at given sentence position
    bool matching(sentence &s, sentence::iterator &p);

    /// set "OnlySelected" flag on/off
    void set_OnlySelected(bool b);

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

Class <tt>automat</tt> implements a generic ATN. The <tt>locutions</tt> class is a derived class which implements an ATN to recognize the word patterns listed in the file given to the constructor.

## Multiword Definition File {#multiword-definition-file}

The file contains a list of multiwords to be recognized.

The file consists of three sections `<TagSetFile>`, `<OnlySelected>`, and `<Multiwords>`. All of them are optional (though an empty or unexisting `<Multiwords>` section will result in never detecting any multiword).

*   Section `<TagSetFile>`. This section contains a single line with the path to a tagset description file (see section

    5.1

    ) to be used when computing short versions for PoS tags. If the path is relative, the location of the multiwords file is used as the base directory.
*   Section `<OnlySelected>` contains a single line with the one of the words `yes`, `true`, `no`, or `false`. If the section is ommited, or contains any unknown value, the value defaults to `false`.

    This flag controls the analysis that the multiword detector will consider when matching a multiwords pattern that contains lemmas or PoS descriptions. If `OnlySelected==false` (the default) all possible analysis for each word will matched against the pattern. If `OnlySelected==true`, only selected analysis will be checked. Note that `OnlySelected==true` only makes sense if the multiwords module is applied after the PoS tagger, since otherwise no analysis will be selected.

*   Section `<Multiwords>` contains one multiword pattern per line. Each line has the format: `form lemma1 pos1 lemma2 pos2 ... [A|I]`

    The multiword form may contain lemmas in angle brackets, meaning that any form with that lemma will be considered a valid component for the multiword.

    The form may also contain PoS tags. Any uppercase component in the form will be treated as a PoS tag.

    Any number of pairs lemma-tag may be assigned to the multiword. The PoS tagger will select the most probable given the context, as with any other word.

    For instance:

    <pre>a_buenas_horas a_buenas_horas RG A
    a_causa_de a_causa_de SPS00 I
    <accidente>_de_trabajo accidente_de_trabajo $1:NC I
    <acabar>_de_VMN0000 acabar_de_$L3 $1:VMI I
    Z_<vez> TIMES:$L1 Zu I
    NC_SP_NC $L1_$L2_$L3 $1:NC I
    </pre>

    The tag may be specified directly, or as a reference to the tag of some of the multiword components. In the previous example, the third multiword specification will build a multiword with any of the forms <tt>accidente de trabajo</tt> or <tt>accidentes de trabajo</tt>. The tag of the multiword will be that of its first form (<tt>$1</tt>) which starts with <tt>NC</tt>. This will assign the right singular/plural tag to the multiword, depending on whether the form was ``accidente'' or ``accidentes''.

    The lemma of the multiword may be specified directly, or as a reference to the form of lemma of some of the multiword components. In the previous example, the fourth multiword specification will build a multiword with phrases such as <tt>acabo de comer</tt>, <tt>acababa de salir</tt>, etc. The lemma will be <tt>acabar_de_XXX</tt> where <tt>XXX</tt> will be replaced with the lemma of the third multiword component (<tt>$L3</tt>).

    The pattern can also depict PoS values for some components of the multiword. For instance, the second-to-last multiword above will detect any combination where the first word has PoS `Z`, and the second word has lemma `vez` (e.g <tt>una_vez</tt>, <tt>6_veces</tt>, <tt>cuarenta_y_dos_veces</tt>, etc.)

    The last example pattern will capture any trigram where the first and third words are nouns (<tt>NC</tt>) and the middle word is a preposition (<tt>SP</tt>), e.g. <tt>base_de_datos</tt>, <tt>compuesto_de_penicilina</tt>, etc.

    Note that patterns that specify lemmas or PoS will behave different depending on the value of the flag `OnlySelected` described above.

    Lemma replacement strings can be <tt>$F1</tt>, <tt>$F2</tt>, <tt>$F3</tt>, etc. to select the lowercased form of any component, or <tt>$L1</tt>, <tt>$L2</tt>, <tt>$L3</tt>, etc. to select the lemma of any component. Component numbers can range from 1 to 9.

    The last field states whether the multiword is ambiguous <tt>A</tt> or not <tt>I</tt> with respect to its segmentation (i.e. that it may be a multiword or not, depending on the context). The multiword is built in any case, but the ambiguity information is stored in the <tt>word</tt> object, so the calling applicacion can consult it and take the necessary decisions (e.g. un-glue the multiword) if needed.

# Named Entity Recognition Module {#named-entity-recognition-module}

There are two different modules able to perform NE recognition. They can be instantiated directly, or via a wrapper that will create the right module depending on the configuration file.

The API for the wrapper is the following:

```C++
class ner {
  public:
    /// Constructor
    ner(const std::wstring &cfgfile);
    /// Destructor
    ~ner();

    /// analyze given sentence
    void analyze(sentence &s) const;

    /// analyze given sentences
    void analyze(std::list<sentence> &ls) const;

    /// analyze sentence, return analyzed copy
    sentence analyze(const sentence &s) const;

    /// analyze sentences, return analyzed copy
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The parameter to the constructor is the absolute name of a configuration file, which must contain the desired module type (`basic` or `bio`) in a line enclosed by the tags `<Type>` and `</Type>`.

The rest of the file must contain the configuration options specific for the selected NER type, described below.

The <tt>basic</tt> module is simple and fast, and easy to adapt for use in new languages, provided capitalization is the basic clue for NE detection in the target language. The estimated performance of this module is about 85% correctly recognized named entities.

The <tt>bio</tt> module, is based on machine learning algorithms. It has a higher precision (over 90%), but it is remarkably slower than <tt>basic</tt>, and adaptation to new languages requires a training corpus plus some feature engineering.

## Basic NER module (<tt>np</tt>) {#basic-ner-module-np}

The first NER module is the <tt>np</tt> class, which is a just an ATN that basically detects sequences of capitalized words, taking into account some functional words (e.g. Bank of England) and capitalization at sentence begginings.

It can be instantiated via the <tt>ner</tt> wrapper described above, or directly via its own API:

```C++
class np: public ner_module, public automat {
  public:
    /// Constructor, receives a configuration file.
    np(const std::string &cfgfile); 

    /// Detect multiwords starting at given sentence position
    bool matching(sentence &s, sentence::iterator &p) const;

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The file that controls the behaviour of the simple NE recognizer consists of the following sections:

*   Section `<FunctionWords>` lists the function words that can be embeeded inside a proper noun (e.g. preposisions and articles such as those in ``Banco de EspaÃ±a'' or ``Foundation for the Eradication of Poverty''). For instance:

    <pre><FunctionWords>
    el
    la
    los
    las
    de
    del
    para
    </FunctionWords>
    </pre>

*   Section `<SpecialPunct>` lists the PoS tags (according to punctuation tags definition file, section

    4.6

    ) after which a capitalized word may be indicating just a sentence or clause beggining and not necessarily a named entity. Typical cases are colon, open parenthesis, dot, hyphen..

    <pre><SpecialPunct>
    Fpa
    Fp
    Fd
    Fg
    </SpecialPunct>
    </pre>

*   Section `<NE_Tag>` contains only one line with the PoS tag that will be assigned to the recognized entities. If the NE classifier is going to be used later, it will have to be informed of this tag at creation time.

    <pre><NE_Tag>
    NP00000
    </NE_Tag>
    </pre>

*   Section `<Ignore>` contains a list of forms (lowercased) or PoS tags (uppercased) that are not to be considered a named entity even when they appear capitalized in the middle of a sentence. For instance, the word Spanish in the sentence He started studying Spanish two years ago is not a named entity. If the words in the list appear with other capitalized words, they are considered to form a named entity (e.g. An announcement of the Spanish Bank of Commerce was issued yesterday). The same distinction applies to the word I in the sentences whatever you say, I don't believe, and _That was the death of Henry I_.

    Each word or tag is followed by a 0 or 1 indicating whether the ignore condition is strict (0: non-strict, 1: strict). The entries marked as non-strict will have the behaviour described above. The entries marked as strict will never be considered named entities or NE parts.

    For instance, the following `<Ignore>` section states that the word ``I'' is not to be a proper noun (whatever you say, I don't believe) unless some of its neighbour words are ( _That was the death of Henry I_). It also states that any word with the <tt>RB</tt> tag, and any of the listed language names must never be considered as possible NEs.

    <pre><Ignore>
    i  0
    RB 1
    english 1
    dutch 1
    spanish 1
    </Ignore>
    </pre>

*   Section `<Names>` contains a list of lemmas that may be names, even if they conflict with some of the heuristic criteria used by the NE recognizer. This is useful when they appear capitalized at sentence beggining. For instance, the basque name Miren (Mary) or the nickname Pelé may appear at the beggining of a Spanish sentence. Since both of them are verbal forms in Spanish, they would not be considered candidates to form named entities.

    Including the form in the `<Names>` section, causes the NE choice to be added to the possible tags of the form, giving the tagger the chance to decide whether it is actually a verb or a proper noun.

    <pre><Names>
    miren
    pelé
    zapatero
    china
    </Names>
    </pre>

*   Section `<Affixes>` contains a list of words that may be part of a NE -either prefixing or suffixing it- even if they are lowercased. For instance, this is the case of the word don in Spanish (e.g. don_Juan should be a NE, even if don is lowercased), or the word junior or jr. in English (e.g. Peter_Grasswick_jr. should be a NE, even if _jr._ is lowercased).

    The section should containt a word per line, followed by the keyword <tt>PRE</tt> or <tt>SUF</tt> stating whether the word may be attached before or after an NE. It a word should be either a prefix or a suffix, it must be declared in two different lines, one with each keyword.

    <pre><Affixes>
    don  PRE
    doña PRE
    jr.  SUF
    <Affixes>
    </pre>

*   Sections `<RE_NounAdj>` `<RE_Closed>` and `<RE_DateNumPunct>` allow to modify the default regular expressions for Part-of-Speech tags. This regular expressions are used by the NER to determine whether a sentence-beginning word has some tag that is Noun or Adj, or any tag that is a closed category, or one of date/punctuation/number. The default is to check against Eagles tags, thus, the recognizer will fail to identifiy these categories if your dictionary uses another tagset, unless you specify the right patterns to look for.

    For instance, if our dictionary uses Penn-Treebank-like tags, we should define:

    <pre><RE_NounAdj>
    ^(NN$|NNS|JJ)
    </RE_NounAdj>
    <RE_Closed>
    ^(D|IN|C)
    </RE_Closed>
    </pre>

*   Section `<TitleLimit>` contains only one line with an integer value stating the length beyond which a sentence written _entirely_ in uppercase will be considered a title and not a proper noun. Example:

    <pre><TitleLimit>
    3
    </TitleLimit>
    </pre>

    If `TitleLimit=0` (the default) title detection is deactivated (i.e, all-uppercase sentences are always marked as named entities).

    The idea of this heuristic is that newspaper titles are usually written in uppercase, and tend to have at least two or three words, while named entities written in this way tend to be acronyms (e.g. IBM, DARPA, ...) and usually have at most one or two words.

    For instance, if `TitleLimit=3` the sentence <tt>FREELING ENTERS NASDAC UNDER CLOSE OBSERVATION OF MARKET ANALYSTS</tt> will not be recognized as a named entity, and will have its words analyzed independently. On the other hand, the sentence <tt>IBM INC.</tt>, having less than 3 words, will be considered a proper noun.

    Obviously this heuristic is not 100% accurate, but in some cases (e.g. if you are analyzing newspapers) it may be preferrable to the default behaviour (which is not 100% accurate, either).

*   Section `<SplitMultiwords>` contains only one line with either `yes` or `no`. If `SplitMultiwords` is activated Named Entities still will be recognized but they will not be treated as a unit with only one Part-of-Speech tag for the whole compound. Each word gets its own Part-of-Speech tag instead. Capitalized words get the Part-of-Speech tag as specified in `NE_Tag`, The Part-of-Speech tags of non-capitalized words inside a Named Entity (typically, prepositions and articles) will be left untouched.

    <pre><SplitMultiwords>
    no
    </SplitMultiwords>
    </pre>

## BIO NER module (<tt>bioner</tt>) {#bio-ner-module-bioner}

The machine-learning based NER module uses a classification algorithm to decide whether each word is at a NE begin (<tt>B</tt>), inside (<tt>I</tt>) or outside (<tt>O</tt>). Then, a simple viterbi algorithm is applied to guarantee sequence coherence.

It can be instantiated via the <tt>ner</tt> wrapper described above, or directly via its own API:

```C++
class bioner: public ner_module {
  public:
    /// Constructor, receives the name of the configuration file.
    bioner ( const std::string & );

    /// analyze given sentence.
    void analyze(sentence &) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &) const;
};
```

The configuration file sets the required model and lexicon files, which may be generated from a training corpus using the scripts provided with FreeLing (in folder <tt>src/utilities/nerc</tt>). Check the README and comments in the scripts to find out what to do.

The most important file in the set is the <tt>.rgf</tt> file, which contains a definition of the context features that must be extracted for each named entity. The feature rule language is described in section

5.4

.

The sections of the configuration file for bioner module are:

*   Section `<RGF>` contains one line with the path to the RGF file of the model. This file is the definition of the features that will be taken into account for NER.

    <pre><RGF>
    ner.rgf
    </RGF>
    </pre>

*   Section `<Classifier>` contains one line with the kind of classifier to use. Valid values are `AdaBoost` and `SVM`.

    <pre><Classifier>
    Adaboost
    </Classifier>
    </pre>

*   Section `<ModelFile>` contains one line with the path to the model file to be used. The model file must match the classifier type given in section `<Classifier>`.

    <pre><ModelFile>
    ner.abm
    </ModelFile>
    </pre>

    The <tt>.abm</tt> files contain AdaBoost models based on shallow Decision Trees (see [CMP03] for details). You don't need to understand this, unless you want to enter into the code of the AdaBoost classifier.

    The <tt>.svm</tt> files contain Support Vector Machine models generated by <tt>libsvm</tt> [CL11]. You don't need to understand this, unless you want to enter into the code of <tt>libsvm</tt>.

*   Section `<Lexicon>` contains one line with the path to the lexicon file of the learnt model. The lexicon is used to translate string-encoded features generated by the extractor to integer-encoded features needed by the classifier. The lexicon file is generated at training time.

    <pre><Lexicon>
    ner.lex
    </Lexicon>
    </pre>

    The <tt>.lex</tt> file is a dictionary that assigns a number to each symbolic feature used in the AdaBoost or SVM model. You don't need to understand this either unless you are a Machine Learning student or the like.
*   Section `<UseSoftMax>` contains only one line with _yes_ or no, indicating whether the classifier output must be converted to probabilities with the SoftMax function. Currently, AdaBoost models need that conversion, and SVM models do not.

    <pre><UseSoftMax>
    yes
    </UseSoftMax>
    </pre>

*   Section `<Classes>` contains only one line with the classes of the model and its translation to B, I, O tag.

    <pre><Classes>
    0 B 1 I 2 O
    </Classes>
    </pre>

*   Section `<NE_Tag>` contains only one line with the PoS tag that will be assigned to the recognized entities. If the NE classifier is going to be used later, it will have to be informed of this tag at creation time.

    <pre><NE_Tag>
    NP00000
    </NE_Tag>
    </pre>

*   Section `<InitialProb>` Contains the probabilities of seeing each class at the begining of a sentence. These probabilities are necessary for the Viterbi algorithm used to annotate NEs in a sentence.

    <pre><InitialProb>
    B 0.200072
    I 0.0
    O 0.799928
    </InitialProb>
    </pre>

*   Section `<TransitionProb>` Contains the transition probabilities for each class to each other class, used by the Viterbi algorithm.

    <pre><TransitionProb>
    B B 0.00829346
    B I 0.395481
    B O 0.596225
    I B 0.0053865
    I I 0.479818
    I O 0.514795
    O B 0.0758838
    O I 0.0
    O O 0.924116
    </TransitionProb>
    </pre>

*   Section `<TitleLimit>` contains only one line with an integer value stating the length beyond which a sentence written _entirely_ in uppercase will be considered a title and not a proper noun. Example:

    <pre><TitleLimit>
    3
    </TitleLimit>
    </pre>

    If `TitleLimit=0` (the default) title detection is deactivated (i.e, all-uppercase sentences are always marked as named entities).

    The idea of this heuristic is that newspaper titles are usually written in uppercase, and tend to have at least two or three words, while named entities written in this way tend to be acronyms (e.g. IBM, DARPA, ...) and usually have at most one or two words.

    For instance, if `TitleLimit=3` the sentence <tt>FREELING ENTERS NASDAC UNDER CLOSE OBSERVATION OF MARKET ANALYSTS</tt> will not be recognized as a named entity, and will have its words analyzed independently. On the other hand, the sentence <tt>IBM INC.</tt>, having less than 3 words, will be considered a proper noun.

    Obviously this heuristic is not 100% accurate, but in some cases (e.g. if you are analyzing newspapers) it may be preferrable to the default behaviour (which is not 100% accurate, either).

*   Section `<SplitMultiwords>` contains only one line with either `yes` or `no`. If `SplitMultiwords` is activated Named Entities still will be recognized but they will not be treated as a unit with only one Part-of-Speech tag for the whole compound. Each word gets its own Part-of-Speech tag instead. Capitalized words get the Part-of-Speech tag as specified in `NE_Tag`, The Part-of-Speech tags of non-capitalized words inside a Named Entity (typically, prepositions and articles) will be left untouched.

    <pre><SplitMultiwords>
    no
    </SplitMultiwords>
    </pre>

# Quantity Recognition Module {#quantity-recognition-module}

The <tt>quantities</tt> class is an ATN that recognizes ratios, percentages, and physical or currency magnitudes (e.g. twenty per cent, 20%, one out of five, 1/5, one hundred miles per hour, etc.

This module depends on the numbers detection module (section

4.5

). If numbers are not previously detected and annotated in the sentence, quantities will not be recognized.

This module, similarly to number recognition, is language dependent: That is, an ATN has to be programmed to match the patterns of ratio expressions in that language.

Currency and physical magnitudes can be recognized in any language, given the appropriate data file.

```C++
class quantities {
  public:
    /// Constructor: receives the language code, and the data file.
    quantities(const std::string &lang, const std::string &cfgfile); 

    /// Detect magnitude expressions starting at given sentence position
    bool matching(sentence &s, sentence::iterator &p) const;

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

## Quantity Recognition Data File {#quantity-recognition-data-file}

This file contains the data necessary to perform currency amount and physical magnitude recognition. It consists of three sections: `<Currency>`, `<Measure>`, and `</MeasureNames>`.

Section `<Currency>` contains a single line indicating which is the code, among those used in section `<Measure>`, that stands for 'currency amount'. This is used to assign to currency ammounts a different PoS tag than physical magnitudes. E.g.:

<pre><Currency>
CUR
</Currency>
</pre>

Section `<Measure>` indicates the type of measure corresponding to each possible unit. Each line contains two fields: the measure code and the unit code. The codes may be anything, at user's choice, and will be used to build the lemma of the recognized quantity multiword.

E.g., the following section states that <tt>USD</tt> and <tt>FRF</tt> are of type <tt>CUR</tt> (currency), <tt>mm</tt> is of type <tt>LN</tt> (length), and <tt>ft/s</tt> is of type <tt>SP</tt> (speed):

<pre><Measure>
CUR USD
CUR FRF
LN mm
SP ft/s
</Measure>
</pre>

Finally, section `<MeasureNames>` describes which multiwords have to be interpreted as a measure, and which unit they represent. The unit must appear in section `<Measure>` with its associated code. Each line has the format:

<pre>multiword_description code tag
</pre>

where <tt>multiword_description</tt> is a multiword pattern as in multiwords file described in section 

4.10

, <tt>code</tt> is the type of magnitude the unit describes (currency, speed, etc.), and <tt>tag</tt> is a constraint on the lemmatized components of the multiword, following the same conventions than in multiwords file (section 

4.10

).

E.g.,

<pre><MeasureNames>
french_<franc> FRF $2:N
<franc> FRF $1:N
<dollar> USD $1:N
american_<dollar> USD $2:N
us_<dollar> USD $2:N
<milimeter> mm $1:N
<foot>_per_second ft/s $1:N
<foot>_Fh_second ft/s $1:N
<foot>_Fh_s ft/s $1:N
<foot>_second ft/s $1:N
</MeasureNames>
</pre>

This section will recognize strings such as the following:

<pre> 234_french_francs CUR_FRF:234 Zm
 one_dollar CUR_USD:1 Zm
 two_hundred_fifty_feet_per_second SP_ft/s:250 Zu
</pre>

Quantity multiwords will be recognized only when following a number, that is, in the sentence There were many french francs, the multiword won't be recognized since it is not assigning units to a determined quantity.

It is important to note that the lemmatized multiword expressions (the ones that containt angle brackets) will only be recognized if the lemma is present in the dictionary with its corresponding inflected forms.

# Probability Assignment and Unkown Word Guesser Module {#probability-assignment-and-unkown-word-guesser-module}

This class ends the morphological analysis subchain, and has two functions: first, it assigns an a priori probability to each analysis of each word. These probablities will be needed for the PoS tagger later. Second, if a word has no analysis (none of the previously applied modules succeeded to analyze it), this module tries to guess which are its possible PoS tags, based on the word ending.

```C++
class probabilities {
  public:
    /// Constructor: receives the name of the file
    // containing probabilities, and a threshold.
    probabilities(const std::string &cfgfile, double thresh);

    /// Assign probabilities for each analysis of given word
    void annotate_word(word &w) const;

    /// Turn guesser on/of
    void set_activate_guesser(bool b);

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The method `set_activate_guesser` will turn on/off the guessing of likely PoS tags for words with no analysis. Note that the guesser is turned on/off for any thread using the same probabilities instance.

The constructor receives:

*   The probabilities file name: The file that contains all needed configuration and statistical information. This file can be generated from a tagged training corpus using the scripts in <tt>src/utilities</tt>. Its format is described below.
*   A threshold: This is used for unknown words, when the probability of each possible tag has been estimated by the guesser according to word endings, tags with a value lower than this threshold are discarded.

## Lexical Probabilities File {#lexical-probabilities-file}

This file can be generated from a tagged corpus using the training script provided in FreeLing package, located at <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt>.

See <tt>src/utilities/train-tagger/README</tt> to find out how to use it.

The probabilities file has the following sections:

*   Optional section `<LemmaPreferences>` and contains a list of pairs of lemmas. The meaning of each pair is that the first element is prefereble to the second in case the tagger can not decide between them and is forced to.

    For instance, the section:

    <pre>       <LemmaPreferences>
           salir salgar
           </LemmaPreferences>
    </pre>

    solves the ambiguity for Spanish word salgo, which may correspond to indicative first person singular of verb salir (go out), or to exactly the same tense of verb salgar (feed salt to cattle). Since the PoS tag is the same for both lemmas, the tagger can not decide which is the right one. This preference solves the dilemma in favour of salir (go out), which is more frequent.

*   Optional section `<PoSPreferences>` and contains a list of pairs of PoS tags. The meaning of each pair is that the first element is prefereble to the second in case the tagger can not decide between them and is forced to. The POS preference is only used when the tie can not be solved using lemma preferences.

    For instance, the section

    <pre>      <PosPreferences>
          VMII3S0 VMII1S0
          </PosPreferences>
    </pre>

    helps solving cases as the past tense for Spanish verbs such as cantaba (I/he sung), which are shared by first and third person. In this case, if the tagger is not able to make a decision a preference is set for 3rd person (which is more frequent in standard text).

*   Section `<TagsetFile>`. This section contains a single line with the path to a tagset description file (see section

    5.1

    ) to be used when computing short versions for PoS tags. If the path is relative, the location of the lexical probabilities file is used as the base directory.
*   Section `<FormTagFreq>`. Probability data of some high frequency forms.

    If the word is found in this list, lexical probabilities are computed using data in `<FormTagFreq>` section.

    The list consists of one form per line, each line with format: <tt>form ambiguity-class, tag1 #observ1 tag2 #observ2 ...</tt>

    E.g. <tt>japonesas AQ-NC AQ 1 NC 0</tt>

    Form probabilities are smoothed to avoid zero-probabilities.

*   Section `<ClassTagFreq>`. Probability data of ambiguity classes.

    If the word is not found in the `<FormTagFreq>`, frequencies for its ambiguity class are used.

    The list consists of class per line, each line with format: <tt>class tag1 #observ1 tag2 #observ2 ...</tt>

    E.g. <tt>AQ-NC AQ 2361 NC 2077</tt>

    Class probabilities are smoothed to avoid zero-probabilities.

*   Section `<SingleTagFreq>`. Unigram probabilities.

    If the ambiguity class is not found in the `<ClassTagFreq>`, individual frequencies for its possible tags are used.

    One tag per line, each line with format: <tt>tag #observ</tt>

    E.g. <tt>AQ 7462</tt>

    Tag probabilities are smoothed to avoid zero-probabilities.

*   Section `<Theeta>`. Value for parameter theeta used in smoothing of tag probabilities based on word suffixes.

    If the word is not found in dictionary (and so the list of its possible tags is unknown), the distribution is computed using the data in the `<Theeta>`, `<Suffixes>`, and `<UnknownTags>` sections.

    The section has exactly one line, with one real number.

    E.g. `<Theeta>` `0.00834` `</Theeta>`

*   Section `<BiassSuffixes>`. Weighted interpolation factor between class probability and word suffixes.

    The section has exactly one line, with one real number.

    E.g. `<BiassSuffixes>` `0.4` `</BiassSuffixes>`

    This section is optional. If ommited, used default value is 0.3.

    The probability of the tags belonging to words unobserved in the training corpus, is computed backing off to the distribution of all words with the same ambiguity class. This obviously overgeneralizes and for some words, the estimated probabilities may be rather far from reality.

    To palliate this overgeneralization, the ambiguity class probabilities can me interpolated with the probabilities assigned by the guesser according to the word suffix.

    This parameter specifies the weight that suffix information is given in the iterpolation, i.e. if `BiassSuffixes=0` only the ambiguity class information is used. If `BiassSuffixes=1`, only the probabilities provided by the guesser are used.

*   Section `<Suffixes>`. List of suffixes obtained from a train corpus, with information about which tags were assigned to the word with that suffix.

    The list has one suffix per line, each line with format: <tt>suffix #observ tag1 #observ1 tag2 #observ2 ...</tt>

    E.g. <tt>orada 133 AQ0FSP 17 VMP00SF 8 NCFS000 108</tt>

*   Section `<UnknownTags>`. List of open-category tags to consider as possible candidates for any unknown word.

    One tag per line, each line with format: <tt>tag #observ</tt>. The tag is the complete label. The count is the number of occurrences in a training corpus.

    E.g. <tt>NCMS000 33438</tt>

*   Section `<LidstoneLambdaLexical>` specifies the _λ_ parameter for Lidstone's Law smoothing.

    The section has exactly one line, with one real number.

    E.g. `<LidstoneLambdaLexical>` `0.2` `</LidstoneLambdaLexical>`

    This section is optional. If ommited, used default value is 0.1.

    This parameter is used only to smooth the lexical probabilities of words that have appeared in the training corpus, and thus are listed in the `<FormTagFreq>` section described above.

*   Section `<LidstoneLambdaClass>` specifies the _λ_ parameter for Lidstone's Law smoothing.

    The section has exactly one line, with one real number.

    E.g. `<LidstoneLambdaClass>` `0.7` `</LidstoneLambdaClass>`

    This section is optional. If ommited, used default value is 0.1.

    This parameter is used only to smooth the lexical probabilities of words that have not appeared in the training corpus, and thus are not listed in the `<FormTagFreq>` section. In these cases, information from appropriate ambiguity class in `<ClassTagFreq>` section is used.

# Alternatives Suggestion Module {#alternatives-suggestion-module}

This module is able to retrieve from its dictionary the entries most similar to the input form. The similarity is computed according to a configurable string edit distance (SED) measure.

The alternatives module can be created to perform a direct search of the form in a dictionary, or either to perform a search of the phonetic transcription of the form in a dictionary of phonetic transcriptions. In the later case, the orthographic forms corresponding to the phonetically similar words are returned. For instance, if a mispelled word such as spid is found, this module will find out that it sounds very close to some correct words in the dictionary (e.g. speed, spit), and return the correctly spelled alternatives. This module is based on the fast search algorithms on FSMs included in the finite-state libray FOMA (<small class="SMALL"><tt>[http://code.google.com/p/foma](http://code.google.com/p/foma)</tt></small>).

The API for this module is the following:

```C++
class alternatives {
  public:
    /// Constructor
    alternatives(const std::wstring &cfgfile);

    /// Destructor
    ~alternatives();

    /// direct access to results of underlying FSM to retrieve
    /// most similar words to the given one
    void get_similar_words(const std::wstring &form,  
                           std::list<std::pair<std::wstring,int> > &results) const;

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

This module will find alternatives for words in the sentences, and enrich them with a list of forms, each with the corresponding SED value. The forms are added to the <tt>alternatives</tt> member of class <tt>word</tt>, which is a <tt>std::list<pair<std::wstring,int»</tt>. The list can be traversed using the iterators <tt>word::alternatives_begin()</tt> and <tt>word::alternatives_end()</tt>.

The constructor of this module expects a configuration file containing the following sections:

*   Section `<General>` contains values for general parameters, expressed in lines of the form `key value`.

    More specifically, it must contain a line `Type (orthographic|phonetic)` stating whether the similar words must be searched using direct SED between of orthographic forms, or between their phonetic encoding.

    This section must also contain one line `Dictionary filename` or either a line `PhoneticDictionary filename` stating the dictionary where the similar words are going to be searched. If `PhoneticDictionary` is stated, then an additional line `PhoneticRule filename` is expected, detailing the configuration file for a phonetic encoding module (see section 

    4.18

    ) that will be used to encode the input forms before the search.

The `Dictionary` can be any file containing one form per line. Only first field in the line will be considered, which makes it possible to use a basic FreeLing dictionary (see section 

4.9

), since the morphological information will be ignored.

The `PhoneticDictionary` must contain one phonetic form per line, followed by a list of orthographic forms mapping to that sound. E.g., valid lines are:

<pre>    f@Ur fore four
    tu too two
</pre>

*   Section `<Distance>` contains `key value` lines stating parameters related to the SED measure to use.

    A line `CostMatrix filename` is expected, stating the file where the SED cost matrix to be used. The `CostMatrix` file must comply with FOMA requirements for cost matrices (see FOMA documentation, or examples provided in `data/common/alternatives` in FreeLing tarball).

    A line `Threshold int-value` can be provided stating the maximum distance of desired alternatives. Note that a very high value will cause the module to produce a long list of similar words, and a too low value may result in no similar forms found.

    A line `MaxSizeDiff int-value` may also be provided. Similar strings with a length difference greater than this parameter will be filtered out of the result. To deactivate this feature, just set the value to a large number (e.g. 99).

    *   Section `<Target>` contains `key value` lines describing which words in the sentence must be checked for similar forms.

    The line `UnknownWords (yes|no)` states whether similar forms are to be searched for unknown words (i.e. words that didn't receive any analysis from any module so far).

    The line `KnownWords regular-expression` states which words with analysis have to be checked. The regular expression is matched against the PoS tag of the words. If the regular-expression is `none`, no known word is checked for similar forms.

# Sense Labelling Module {#sense-labelling-module}

This module searches the lemma of each analysis in a sense dictionary, and enriches the analysis with the list of senses found there.

Note that this is not disambiguation, all senses for the lemma are returned.

The module receives a file containing several configuration options, which specify the sense dictionary to be used, and some mapping rules that can be used to adapt FreeLing PoS tags to those used in the sense dictionary.

FreeLing provides WordNet-based [Fel98,Vos98] dictionaries, but the results of this module can be changed to any other sense catalogue simply providing a different sense dictionary file.

```C++
class senses {
  public:
    /// Constructor: receives the name of the configuration file
    senses(const std::string &cfgfile); 

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor of this class receives the name of a configuration file which is expected to contain the following sections:

*   A section `<WNposMap>` with the mapping rules of FreeLing PoS tags to sense dictionary PoS tags. See details in section

    5.2

    .
*   A section `<DataFiles>` containing at least the keyword `SenseDictFile` defined to a valid sense dictionary file name. E.g.:

    <pre>    <DataFiles>
        SenseDictFile  ./senses30.src
        </DataFiles>
    </pre>

    The sense dictionary must follow the format described in section

    5.2.2

    .

    If the mapping rules `<WNposMap>` require a form dictionary, a keyword `formDictFile` with the dictionary to use must be provided in this section. More details are given in section

    5.2

    .

*   A section `<DuplicateAnalysis>` containing a single line with either `yes` or `no`, stating whether the analysis with more than one senses must be duplicated. If this section is ommitted, `no` is used as default value. The effect of activating this option is described in the following example:

    For instance, the word crane has the follwing analysis:

    <pre>    crane 
           crane NN  0.833
           crane VB  0.083
           crane VBP 0.083
    </pre>

    If the list of senses is simply added to each of them (that is, <tt>DuplicateAnalysis</tt> is set to <tt>false</tt>), you will get:

    <pre>    crane 
           crane NN  0.833  02516101:01524724
           crane VB  0.083  00019686
           crane VBP 0.083  00019686
    </pre>

    But if you set <tt>DuplicateAnalysis</tt> to true, the <tt>NN</tt> analysis will be duplicated for each of its possible senses:

    <pre>    crane 
           crane NN  0.416  02516101
           crane NN  0.416  01524724
           crane VB  0.083  00019686
           crane VBP 0.083  00019686
    </pre>

# Word Sense Disambiguation Module {#word-sense-disambiguation-module}

This module performs word-sense-disambiguation on content words in given sentences. This module is to be used if word sense disambiguation (WSD) is desired. If no disambiguation (or basic most-frequent-sense disambiguation) is needed, the senses module described in section

4.15

is a lighter and faster option.

The module is an implementation of UKB algorithm [AS09]. UKB relies on a semantic relation network (in this case, WN and XWN) to disambiguate the most likely senses for words in a text using PageRank algorithm. See [AS09] for details on the algorithm.

The module expects the input words to have been annotated with a list of candidate senses by the senses module (section

4.15

) It ranks the candidate senses and sorts the list, according to the PageRank for each sense. The rank value is also provided in the result.

The API of the class is the following:

```C++
class ukb {
  public:
    /// Constructor. Receives a configuration file for UKB
    ukb(const std::string &cfgfile);

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor receives a file name where module configuration options are found. The contents of the configuration files are the following:

*   A section `<PageRankParameters>` specifying values for UKB stopping criteria. E.g.:

    <pre>    <PageRankParameters>
        Epsilon 0.03
        MaxIterations 10 
        Damping 0.85
        </PageRankParameters>
    </pre>

    These parameters are UKB parameters: The an _epsilon_ float value that controls the precision with with the end of PageRank iterations is decided, and a MaxIterations integer, that controls the maximum number of PageRank iterations, even is no convergence is reached. The Damping parameter is the standard parameter in PageRank algorithm.
*   A section `<RelationFile>` specifying the knowledge base required by the algorithm. This section must one lines, with the path to a file containing a list of relations between senses.

    <pre>    <RelationFile>
        ../common/xwn.dat
        </RelationFile>
    </pre>

    The path may be absolute, or relative to the position of the ukb module configuration file.

    The RelationFile contains the semantic relationship graph to load. It is a text filecontaining pairs of related senses (WN synsets in this case). Relations are not labelled nor directed.

    An example of the content of this file is:

    <pre>   00003431-v 14877585-n
       00003483-r 00104099-r
       00003483-r 00890351-a
    </pre>

# Part-of-Speech Tagger Module {#part-of-speech-tagger-module}

There are two different modules able to perform PoS tagging. The application should decide which method is to be used, and instantiate the right class.

The first PoS tagger is the <tt>hmm_tagger</tt> class, which is a classical trigam Markovian tagger, following [Bra00].

The second module, named <tt>relax_tagger</tt>, is a hybrid system capable to integrate statistical and hand-coded knowledge, following [Pad98].

The <tt>hmm_tagger</tt> module is somewhat faster than <tt>relax_tagger</tt>, but the later allows you to add manual constraints to the model. Its API is the following:

```C++
class hmm_tagger: public POS_tagger {
  public:
    /// Constructor
    hmm_tagger(const std::string &hmmfile, 
               bool retok, 
               unsigned int force, 
               unsigned int kb=1);

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;

    /// given an analyzed sentence find out probability 
    /// of the k-th best sequence
    double SequenceProb_log(const sentence &s, int k=0) const;
};
```

The <tt>hmm_tagger</tt> constructor receives the following parameters:

*   The HMM file, which containts the model parameters. The format of the file is described below. This file can be generated from a tagged corpus using the script <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt> provided in FreeLing package. See <tt>src/utilities/train-tagger/README</tt> to find out the details.
*   A boolean stating whether words that carry retokenization information (e.g. set by the dictionary or affix handling modules) must be retokenized (that is, splitted in two or more words) after the tagging.
*   An integer stating whether and when the tagger must select only one analysis in case of ambiguity. Possbile values are: <tt>FORCE_NONE (or 0)</tt>: no selection forced, words ambiguous after the tagger, remain ambiguous. <tt>FORCE_TAGGER (or 1)</tt>: force selection immediately after tagging, and before retokenization. <tt>FORCE_RETOK (or 2)</tt>: force selection after retokenization.
*   An integer stating how many best tag sequences the tagger must try to compute. If not specified, this parameter defaults to 1. Since a sentence may have less possible tag sequences than the given <tt>k</tt> value, the results may contain a number of sequences smaller than <tt>k</tt>.

The <tt>relax_tagger</tt> module can be tuned with hand written constraint, but is about 2 times slower than <tt>hmm_tagger</tt>. It is not able to produce <tt>k</tt> best sequences either.

```C++
class relax_tagger : public POS_tagger {
  public:
    /// Constructor, given the constraint file and config parameters
    relax_tagger(const std::string &cfgfile, 
                 int m, 
                 double f, 
                 double r, 
                 bool retok, 
                 unsigned int force);

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The <tt>relax_tagger</tt> constructor receives the following parameters:

*   The constraint file. The format of the file is described below. This file can be generated from a tagged corpus using the script <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt> provided in FreeLing package. See <tt>src/utilities/train-tagger/README</tt> for details.
*   An integer <tt>m</tt> stating the maximum number of iterations to wait for convergence before stopping the disambiguation algorithm.
*   A real number <tt>f</tt> representing the scale factor of the constraint weights.
*   A real number <tt>r</tt> representing the threshold under which any changes will be considered too small. Used to detect convergence.
*   A boolean <tt>retok</tt> stating whether words that carry retokenization information (e.g. set by the dictionary or affix handling modules) must be retokenized (that is, splitted in two or more words) after the tagging.
*   An integer <tt>force</tt> stating whether and when the tagger must select only one analysis in case of ambiguity. Possbile values are: <tt>FORCE_NONE (or 0)</tt>: no selection forced, words ambiguous after the tagger, remain ambiguous. <tt>FORCE_TAGGER (or 1)</tt>: force selection immediately after tagging, and before retokenization. <tt>FORCE_RETOK (or 2)</tt>: force selection after retokenization.

The iteration number, scale factor, and threshold parameters are very specific of the relaxation labelling algorithm. Refer to [Pad98] for details.

## HMM-Tagger Parameter File {#hmm-tagger-parameter-file}

This file contains the statistical data for the Hidden Markov Model, plus some additional data to smooth the missing values. Initial probabilities, transition probabilities, lexical probabilities, etc.

The file may be generated by your own means, or using a tagged corpus and the training script provided in FreeLing package: <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt>.

See <tt>src/utilities/train-tagger/README</tt> for details.

The file has eight sections which contain -among other things- the paremeters of the HMM (e.g. the tag (unigram), bigram, and trigram probabilities used in Linear Interpolation smoothing by the tagger to compute state transition probabilities ( _α_<sub>ij</sub> parameters of the HMM):

*   Section `<TagsetFile>`. This section contains a single line with the path to a tagset description file (see section

    5.1

    ) to be used when computing short versions for PoS tags. If the path is relative, the location of the lexical probabilities file is used as the base directory.

    This section has to appear before section `<Forbidden>`.

*   Section `<Tag>`. List of unigram tag probabilities (estimated via your preferred method). Each line is a tag probability <tt>P(t)</tt> with format <tt>Tag Probability</tt>

    Lines for zero tag (for initial states) and for <tt>x</tt> (unobserved tags) must be included.

    E.g. <tt>0 0.03747</tt> <tt>AQ 0.00227</tt> <tt>NC 0.18894</tt> <tt>x 1.07312e-06</tt>

*   Section `<Bigram>`. List of bigram transition probabilities (estimated via your preferred method). Each line is a transition probability, with the format: <tt>Tag1.Tag2 Probability</tt>

    Tag zero indicates sentence-beggining.

    E.g. the following line indicates the transition probability between a sentence start and the tag of the first word being <tt>AQ</tt>. <tt>0.AQ 0.01403</tt>

    E.g. the following line indicates the transition probability between two consecutive tags. <tt>AQ.NC 0.16963</tt>

*   Section `<Trigram>`. List of trigram transition probabilities (estimated via your preferred method). Each line is a transition probability, with the format: <tt>Tag1.Tag2.Tag3 Probability</tt>.

    Tag zero indicates sentence-beggining.

    E.g. the following line indicates the probability that a word has <tt>NC</tt> tag just after a <tt>0.AQ</tt> sequence. <tt>0.AQ.NC 0.204081</tt>

    E.g. the following line indicates the probability of a tag <tt>SP</tt> appearing after two words tagged <tt>DA</tt> and <tt>NC</tt>. <tt>DA.NC.SP 0.33312</tt>

*   Section `<Initial>`. List of initial state probabilities (estimated via your preferred method), i.e. the _π_<sub>i</sub> parameters of the HMM. Each line is an initial probability, with the format <tt>InitialState LogProbability</tt>.

    Each <tt>InitialState</tt> is a PoS-bigram code with the form <tt>0.tag</tt>. Probabilities are given in logarithmic form to avoid underflows.

    E.g. the following line indicates the probability that the sequence starts with a determiner. <tt>0.DA -1.744857</tt>

    E.g. the following line indicates the probability that the sequence starts with an unknown tag. <tt>0.x -10.462703</tt>

*   Section `<Word>`. Contains a list of word probabilities <tt>P(w)</tt> (estimated via your preferred method). It is used, toghether with the tag probabilities above, to compute emission probabilities (_b_<sub>iw</sub> parameters of the HMM).

    Each line is a word probability <tt>P(w)</tt> with format: <tt>word LogProbability</tt>. A special line for `<UNOBSERVED_WORD>` must be included. Sample lines for this section are:

    `afortunado -13.69500` `sutil -13.57721` `<UNOBSERVED_WORD> -13.82853`

*   Section `<Smoothing>` contains three lines with the coefficients used for linear interpolation of unigram (`c1`), bigram (`c2`), and trigram (`c3`) probabilities. The section looks like:

    `<Smoothing>` `c1 0.120970620869314` `c2 0.364310868831106` `c3 0.51471851029958` `</Smoothing>`

*   Section `<Forbidden>` is the only that is not generated by the training scripts, and is supposed to be manually added (if needed). The utility is to prevent smoothing of some combinations that are known to have zero probability.

    Lines in this section are trigrams, in the same format than above: `Tag1.Tag2.Tag3`

    Trigrams listed in this section will be assigned zero probability, and no smoothing will be performed. This will cause the tagger to avoid any solution including these subsequences.

    The first tag may be a wildcard (`*`), which will match any tag, or the tag `0` which denotes sentence beginning. These two special tags can only be used in the first position of the trigram.

    In the case of an EAGLES tagset, the tags in the trigram may be either the short or the long version. The tags in the trigram (except the special tags `*` and `0`) can be restricted to a certain lemma, suffixing them with the lemma in angle brackets.

    For instance, the following rules will assign zero probability to any sequence containing the specified trigram:

    `*.PT.NC`: a noun after an interrogative pronoun. `0.DT.VMI`: a verb in indicative following a determiner just after sentence beggining. `SP.PP.NC`: a noun following a preposition and a personal pronoun.

    Similarly, the set of rules:

    `*.VAI<haber>.NC` `*.VAI<haber>.AQ` `*.VAI<haber>.VMP00SF` `*.VAI<haber>.VMP00PF` `*.VAI<haber>.VMP00PM`

    will assign zero probability to any sequence containing the verb ``haber'' tagged as an auxiliar (VAI) followed by any of the listed tags. Note that the masculine singular participle is not excluded, since it is the only allowed after an auxiliary ``haber''.

## Relaxation-Labelling Constraint Grammar File {#relaxation-labelling-constraint-grammar-file}

The syntax of the file is based on that of Constraint Grammars [KVHA95], but simplified in many aspects, and modified to include weighted constraints.

An initial file based on statistical constraints may be generated from a tagged corpus using the <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt> script provided with FreeLing. Later, hand written constraints can be added to the file to improve the tagger behaviour.

The file consists of two sections: <tt>SETS</tt> and <tt>CONSTRAINTS</tt>.

### Set definition {#set-definition}

The <tt>SETS</tt> section consists of a list of set definitions, each of the form <tt>Set-name = element1 element2 ... elementN ;</tt>

Where the <tt>Set-name</tt> is any alphanumeric string starting with a capital letter, and the elements are either forms, lemmas, plain PoS tags, or senses. Forms are enclosed in parenthesis -e.g. `(comimos)`-, lemmas in angle brackets -e.g. `<comer>`-, PoS tags are alphanumeric strings starting with a capital letter -e.g. `NCMS000`-, and senses are enclosed in square brackets -e.g. `[00794578]`. The sets must be homogeneous: That is, all the elements of a set have to be of the same kind.

Examples of set definitions:

<pre>   DetMasc = DA0MS0 DA0MP0 DD0MS0 DD0MP0 DI0MS0 DI0MP0 DP1MSP DP1MPP
             DP2MSP DP2MPP DT0MS0 DT0MP0 DE0MS0 DE0MP0 AQ0MS0 AQ0MP0;
   VerbPron = <dar_cuenta> <atrever> <arrepentir> <equivocar> <inmutar>
              <morir> <ir> <manifestar> <precipitar> <referir> <venir>;
   Animal = [00008019] [00862484] [00862617] [00862750] [00862871] [00863425]
            [00863992] [00864099] [00864394] [00865075] [00865379] [00865569]
            [00865638] [00867302] [00867448] [00867773] [00867864] [00868028]
            [00868297] [00868486] [00868585] [00868729] [00911889] [00985200]
            [00990770] [01420347] [01586897] [01661105] [01661246] [01664986] 
            [01813568] [01883430] [01947400] [07400072] [07501137];
</pre>

### Constraint definition {#constraint-definition}

The <tt>CONSTRAINTS</tt> section consists of a series of context constraits, each of the form: <tt>weight core context;</tt>

Where:

*   <tt>weight</tt> is a real value stating the compatibility (or incompatibility if negative) degree of the <tt>label</tt> with the <tt>context</tt>.
*   <tt>core</tt> indicates the analysis or analyses (form interpretation) in a word that will be affected by the constraint. It may be:
    *   Plain tag: A plain complete PoS tag, e.g. <tt>VMIP3S0</tt>
    *   Wildcarded tag: A PoS tag prefix, right-wilcarded, e.g. <tt>VMI*</tt>, <tt>VMIP*</tt>.
    *   Lemma: A lemma enclosed in angle brackets, optionaly preceded by a tag or a wildcarded tag. e.g. `<comer>`, `VMIP3S0<comer>`, `VMI*<comer>` will match any word analysis with those tag/prefix and lemma.
    *   Form: Form enclosed in parenthesis, preceded by a PoS tag (or a wilcarded tag). e.g. <tt>VMIP3S0(comió)</tt>, <tt>VMI*(comió)</tt> will match any word analysis with those tag/prefix and form. Note that the form alone is not allowed in the rule core, since the rule woull to distinguish among different analysis of the same form.
    *   Sense: A sense code enclosed in square brackets, optionaly preceded by a tag or a wildcarded tag. e.g. `[00862617]`, `NCMS000[00862617]`, `NC*[00862617]` will match any word analysis with those tag/prefix and sense.
*   <tt>context</tt> is a list of conditions that the context of the word must satisfy for the constraint to be applied. Each condition is enclosed in parenthesis and the list (and thus the constraint) is finished with a semicolon. Each condition has the form: <tt>(position terms)</tt> or either: <tt>(position terms barrier terms)</tt>

    Conditions may be negated using the token <tt>not</tt>, i.e. <tt>(not pos terms)</tt>

    Where:

    *   <tt>position</tt> is the relative position where the condition must be satisfied: -1 indicates the previous word and +1 the next word. A position with a star (e.g. -2*) indicates that any word is allowed to match starting from the indicated position and advancing towards the beggining/end of the sentence.
    *   <tt>terms</tt> is a list of one or more terms separated by the token <tt>or</tt>. Each term may be:
        *   Plain tag: A plain complete PoS tag, e.g. <tt>VMIP3S0</tt>
        *   Wildcarded tag: A PoS tag prefix, right-wilcarded, e.g. <tt>VMI*</tt>, <tt>VMIP*</tt>.
        *   Lemma: A lemma enclosed in angle brackets, optionaly preceded by a tag or a wildcarded tag. e.g. `<comer>`, `VMIP3S0<comer>`, `VMI*<comer>` will match any word analysis with those tag/prefix and lemma.
        *   Form: Form enclosed in parenthesis, optionally preceded by a PoS tag (or a wilcarded tag). e.g. <tt>(comió)</tt>, <tt>VMIP3S0(comió)</tt>, <tt>VMI*(comió)</tt> will match any word analysis with those tag/prefix and form. Note that -contrarily to when defining the rule core- the form alone is allowed in the context.
        *   Sense: A sense code enclosed in square brackets, optionaly preceded by a tag or a wildcarded tag. e.g. `[00862617]`, `NCMS000[00862617]`, `NC*[00862617]` will match any word analysis with those tag/prefix and sense.
        *   Set reference: A name of a previously defined SET in curly brackets. e.g. `{DetMasc}`, `{VerbPron}` will match any word analysis with a tag, lemma or sense in the specified set.
    *   <tt>barrier</tt> states that the a match of the first term list is only acceptable if between the focus word and the matching word there is no match for the second term list.

Note that the use of sense information in the rules of the constraint grammar (either in the core or in the context) only makes sense when this information distinguishes one analysis from another. If the sense tagging has been performed with the option `DuplicateAnalysis=no`, each PoS tag will have a list with all analysis, so the sense information will not distinguish one analysis from the other (there will be only one analysis with that sense, which will have at the same time all the other senses as well). If the option `DuplicateAnalysis` was active, the sense tagger duplicates the analysis, creating a new entry for each sense. So, when a rule selects an analysis having a certain sense, it is unselecting the other copies of the same analysis with different senses.

### Examples {#examples}

Examples: The next constraint states a high incompatibility for a word being a definite determiner (<tt>DA*</tt>) if the next word is a personal form of a verb (<tt>VMI*</tt>): <tt>-8.143 DA* (1 VMI*);</tt>

The next constraint states a very high compatibility for the word mucho (much) being an indefinite determiner (<tt>DI*</tt>) -and thus not being a pronoun or an adverb, or any other analysis it may have- if the following word is a noun (<tt>NC*</tt>): <tt>60.0 DI* (mucho) (1 NC*);</tt>

The next constraint states a positive compatibility value for a word being a noun (<tt>NC*</tt>) if somewhere to its left there is a determiner or an adjective (<tt>DA* or AQ*</tt>), and between them there is not any other noun: <tt>5.0 NC* (-1* DA* or AQ* barrier NC*);</tt>

The next constraint states a positive compatibility value for a word being a masculine noun (<tt>NCM*</tt>) if the word to its left is a masculine determiner. It refers to a previously defined SET which should contain the list of all tags that are masculine determiners. This rule could be useful to correctly tag Spanish words which have two different NC analysis differing in gender: e.g. el cura (the priest) vs. la cura (the cure): <tt>5.0 NCM* (-1* DetMasc;)</tt>

The next constraint adds some positive compatibility to a 3rd person personal pronoun being of undefined gender and number (<tt>PP3CNA00</tt>) if it has the possibility of being masculine singular (<tt>PP3MSA00</tt>), the next word may have lemma estar (to be), and the second word to the right is not a gerund (<tt>VMG</tt>). This rule is intended to solve the different behaviour of the Spanish word lo (it) in sentences such as ``Â¿Cansado? Si, lo estoy.'' (Tired? Yes, I am [it]) or ``lo estoy viendo.'' (I am watching it). `0.5 PP3CNA00 (0 PP3MSA00) (1 <estar>) (not 2 VMG*);`

# Phonetic Encoding Module {#phonetic-encoding-module}

The phonetic encoding module enriches words with their SAMPA

<sup><span class="arabic">4</span>.<span class="arabic">2</span></sup>

phonetic codification.

The module applies a set of rules to transform the written form to the output phonetic form, thus the rules can be changed to get the output in any other phonetic alphabet. The module can also use an exception dictionary to handle forms that do not follow the default rules, or for languages with highly irregular ortography.

The API of the module is the following:

```C++
class phonetics {

 public:
  /// Constructor, given config file
  phonetics(const std::wstring &cfgfile);

  /// Returns the phonetic sound of the word
  std::wstring get_sound(const std::wstring &form) const;

  /// analyze given sentence, enriching words with phonetic encoding
  void analyze(sentence &s) const;

  /// analyze given sentences
  void analyze(std::list<sentence> &ls) const;

  /// analyze sentence, return analyzed copy
  sentence analyze(const sentence &s) const;

  /// analyze sentences, return analyzed copy
  std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor receives a configuration file that contains the transformation rules to apply and the exception dictionary.

The module can be used to transform a single string (method `get_sound`) or to enrich all words in a sentence (or sentence list) with their phonetic information.

The phonetic encoding is stored in the word object and can be retrieved using the method `get_ph_form` in the `word` class.

The format of the configuration file is the following:

There can be at most one exception dictionary, delimited by `<Exceptions>` and `</Exceptions>`. Each entry in the dictionary contains two fields: a lowercase word form and the output phonetic encoding. E.g.:

<pre>addition @dISIn
varieties B@raIItiz
worcester wUst@r
</pre>

If a word form is found in the exceptions dictionary, the corresponding phonetic string is returned and no transformation rules are applied.

There can be one or more rulesets delimited by `<Rules>` and `</Rules>`. Rulesets are applied in the order they are defined. Each ruleset is applied on the result of the previous.

Rulesets can contain two kind of lines: Category definitions and rules.

Category definitions are of the form `X=abcde` and define a set of characters under a single name. Category names must have exactly one character, which should not be part of the input or output alphabet to avoid ambiguities. e.g.:

<pre>U=aeiou
V=aeiouäëïöüâêîôûùò@
L=äëïöüäëïöüäëïöüùò@
S=âêîôûâêîôûâêîôûùò@
A=aâä
E=eêë
</pre>

Categories are only active for rules in the same ruleset where the category is defined.

Rules are of the form `source/target/context`. Both `source` and `target` may be either a category name or a terminal string.

Simple string rules replace the first string with the second if and only if it occurs in the given context. Contexts must contain a "_" symbol indicating where the source string is located. They may also contain characters, categories, and the symbols (word beginning), or $ (word end). The empty context "_" is always satisfied.

Rules can only change terminal strings to terminal strings, or categories to categories (i.e. both `source` and `target` have to be of the same type). If a category is to be changed to another category, they should contain the same number of characters. Otherwise the second category will have its last letter repeated until it has the same length as the first (if it is shorter), or characters in the second category that don't match characters in the first will be ignored.

Some example rules for English:

<pre>qu/kw/_
h//^r_
a/ò/_lmV$
U/L/C_CV
</pre>

First rule `qu/kw/_` replaces string `qu` with `kw` in any context. Second rule `h//^r_` removes character `h` when it is preceeded by `r` at word beginning. Rule `a/ò/_lmV$` replaces `a` with `ò` when followed by `l`, `m`, any character in category `V` and the end of the word. Rule `U/L/C_CV` replaces any character in category `U` with the character in the same position in category `L`, when preceeded by any character in category `C` and followed by any character in category `C` and any character in category `V`.

Note that uppercase characters for categories is just a convention. An uppercase letter may be a terminal symbol, and a lowercase may be a category name. Non-alphabetical characters are also allowed. If a character is not defined as a category name, it will be considered a terminal character.

# Named Entity Classification Module {#named-entity-classification-module}

The mission of the Named Entity Classification module is to assing a class to named entities in the text. It is a Machine-Learning based module, so the classes can be anything the model has been trained to recognize.

When classified, the PoS tag of the word is changed to the label defined in the model.

This module depends on a NER module being applied previously. If no entities are recognized, none can be classified.

Models provided with FreeLing distinguish four classes: Person (tag <tt>NP00SP0</tt>), Geographical location (<tt>NP00G00</tt>), Organization (<tt>NP00O00</tt>), and Others (<tt>NP00V00</tt>).

If you have an anotated corpus, the models can be trained using the scripts in <tt>src/utilities/nerc</tt>. See the README there and the comments inside the script for details.

The most important file in the set is the <tt>.rgf</tt> file, which contains a definition of the context features that must be extracted for each named entity. The feature rule language is described in section

5.4

.

The API of the class is the following:

```C++
class nec {
  public:
    /// Constructor
    nec(const std::string &cfgfile); 

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor receives one parameter with the name of the configuration file for the module. Its content is described below.

## NEC Data File {#nec-data-file}

The machine-learning based Named Entity Classification module reads a configuration file with the following sections

*   Section `<RGF>` contains one line with the path to the RGF file of the model. This file is the definition of the features that will be taken into account for NEC.

    <pre><RGF>
    ner.rgf
    </RGF>
    </pre>

*   Section `<Classifier>` contains one line with the kind of classifier to use. Valid values are `AdaBoost` and `SVM`.

    <pre><Classifier>
    Adaboost
    </Classifier>
    </pre>

*   Section `<ModelFile>` contains one line with the path to the model file to be used. The model file must match the classifier type given in section `<Classifier>`.

    <pre><ModelFile>
    ner.abm
    </ModelFile>
    </pre>

    The <tt>.abm</tt> files contain AdaBoost models based on shallow Decision Trees (see [CMP03] for details). You don't need to understand this, unless you want to enter into the code of the AdaBoost classifier.

    The <tt>.svm</tt> files contain Support Vector Machine models generated by <tt>libsvm</tt> [CL11]. You don't need to understand this, unless you want to enter into the code of <tt>libsvm</tt>.

*   Section `<Lexicon>` contains one line with the path to the lexicon file of the learnt model. The lexicon is used to translate string-encoded features generated by the feature extractor to integer-encoded features needed by the classifier. The lexicon file is generated at training time.

    <pre><Lexicon>
    ner.lex
    </Lexicon>
    </pre>

    The <tt>.lex</tt> file is a dictionary that assigns a number to each symbolic feature used in the AdaBoost or SVM model. You don't need to understand this either unless you are a Machine Learning student or the like.
*   Section `<Classes>` contains only one line with the classes of the model and its translation to B, I, O tag.

    <pre><Classes>
    0 NP00SP0 1 NP00G00 2 NP00O00 3 NP00V00
    </Classes>
    </pre>

*   Section `<NE_Tag>` contains only one line with the PoS tag assigned by the NER module, which will be used to select named entities to be classified.

    <pre><NE_Tag>
    NP00000
    </NE_Tag>
    </pre>

# Chart Parser Module {#chart-parser-module}

The chart parser enriches each <tt>sentence</tt> object with a <tt>parse_tree</tt> object, whose leaves have a link to the sentence words.

The API of the parser is:

```C++
class chart_parser {
 public:
   /// Constructor
   chart_parser(const std::string &cfgfile);

   /// Get the start symbol of the grammar
   std::string get_start_symbol() const;

   /// analyze given sentence.
   void analyze(sentence &s) const;

   /// analyze given sentences.
   void analyze(std::list<sentence> &ls) const;

   /// return analyzed copy of given sentence
   sentence analyze(const sentence &s) const;

   /// return analyzed copy of given sentences
   std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor receives a file with the CFG grammar to be used by the grammar, which is described in the next section

The method <tt>get_start_symbol</tt> returns the initial symbol of the grammar, and is needed by the dependency parser (see below).

## Shallow Parser CFG file {#shallow-parser-cfg-file}

This file contains a CFG grammar for the chart parser, and some directives to control which chart edges are selected to build the final tree. Comments may be introduced in the file, starting with ``%'', the comment will finish at the end of the line.

Grammar rules have the form: <tt>x ==> y, A, B.</tt>

That is, the head of the rule is a non-terminal specified at the left hand side of the arrow symbol. The body of the rule is a sequence of terminals and nonterminals separated with commas and ended with a dot.

Empty rules are not allowed, since they dramatically slow chart parsers. Nevertheless, any grammar may be written without empty rules (assuming you are not going to accept empty sentences).

Rules with the same head may be or-ed using the bar symbol, as in: <tt>x ==> A, y | B, C.</tt>

The head component for the rule maybe specified prefixing it with a plus (+) sign, e.g.: <tt>nounphrase ==> DT, ADJ, +N, prepphrase.</tt> . If the head is not specified, the first symbol on the right hand side is assumed to be the head. The head marks are not used in the chart parsing module, but are necessary for later dependency tree building.

The grammar is case-sensitive, so make sure to write your terminals (PoS tags) exactly as they are output by the tagger. Also, make sure that you capitalize your non-terminals in the same way everywhere they appear.

Terminals are PoS tags, but some variations are allowed for flexibility:

*   Plain tag: A terminal may be a plain complete PoS tag, e.g. <tt>VMIP3S0</tt>
*   Wildcarding: A terminal may be a PoS tag prefix, right-wilcarded, e.g. <tt>VMI*</tt>, <tt>VMIP*</tt>.
*   Specifying lemma: A terminal may be a PoS tag (or a wilcarded prefix) with a lemma enclosed in angle brackets, e.g `VMIP3S0<comer>`, `VMI*<comer>` will match only words with those tag/prefix and lemma.
*   Specifying form: A terminal may be a PoS tag (or a wilcarded prefix) with a form enclosed in parenthesis, e.g <tt>VMIP3S0(comió)</tt>, <tt>VMI*(comió)</tt> will match only words with those tag/prefix and form.
*   If a double-quoted string is given inside the angle brackets or parenthesis (e.g. `VMI*("myforms.dat")` or `VMIP3S0<"mylemmas.dat">`) it is interpreted as a file name, and the terminal will match any lemma (or word form) found in that file. If the file name is not an absolute path, it is interpreted as a relative path based at the location of the grammar file.

The grammar file may contain also some directives to help the parser decide which chart edges must be selected to build the tree. Directive commands start with the directive name (always prefixed with ``@''), followed by one or more non-terminal symbols, separated with spaces. The list must end with a dot.

*   <tt>@NOTOP</tt> Non-terminal symbols listed under this directive will not be considered as valid tree roots, even if they cover the complete sentence.
*   <tt>@START</tt> Specify which is the start symbol of the grammar. Exactly one non-terminal must be specified under this directive. The parser will attempt to build a tree with this symbol as a root. If the result of the parsing is not a complete tree, or no valid root nodes are found, a fictitious root node is created with this label, and all created trees are attached to it.
*   <tt>@FLAT</tt> Subtrees for "flat" non-terminal symbols are flattened when the symbol is recursive. Only the highest occurrence appears in the final parse tree.
*   <tt>@HIDDEN</tt> Non-teminal symbols specified under this directive will not appear in the final parse tree (their descendant nodes will be attached to their parent).
*   <tt>@PRIOR</tt> lists of non-terminal symbols in decreasing priority order (the later in the list, the lower priority). When a top cell can be covered with two different non-terminals, the one with highest priority is chosen. This has no effect on non-top cells (in fact, if you want that, your grammar is probably ambiguous and you should rethink it...)

# Rule-based Dependency Parser Module {#rule-based-dependency-parser-module}

The Txala dependency parser [ACM05] gets parsed sentences -that is, <tt>sentence</tt> objects which have been enriched with a <tt>parse_tree</tt> by the <tt>chart_parser</tt> (or by any other means).

```C++
class dep_txala : public dependency_parser {
 public:   
   /// constructor
   dep_txala(const std::string &cfgfile, const std::string &start);

   /// analyze given sentence.
   void analyze(sentence &s) const;

   /// analyze given sentences.
   void analyze(std::list<sentence> &ls) const;

   /// return analyzed copy of given sentence
   sentence analyze(const sentence &s) const;

   /// return analyzed copy of given sentences
   std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor receives two strings: the name of the file containging the dependency rules to be used, and the start symbol of the grammar used by the <tt>chart_parser</tt> to parse the sentence.

The dependency parser works in three stages:

*   At the first stage, the `<GRPAR>` rules are used to complete the shallow parsing produced by the chart into a complete parsing tree. The rules are applied to a pair of adjacent chunks. At each step, the selected pair is fused in a single chunk. The process stops when only one chunk remains
*   The next step is an automatic conversion of the complete parse tree to a dependency tree. Since the parsing grammar encodes information about the head of each rule, the conversion is straighforward
*   The last step is the labeling. Each edge in the dependeny tree is labeled with a syntactic function, using the `<GRLAB>` rules

The syntax and semantics of `<GRPAR>` and `<GRLAB>` rules are described in section

4.21.1

.

## Dependency Parsing Rule File {#dependency-parsing-rule-file}

The dependency rules file contains a set of rules to perform dependency parsing.

The file consists of five sections: sections: `<GRPAR>`, `<GRLAB>`, `<SEMDB>`, `<CLASS>`, and `<PAIRS>`, respectively closed by tags `</GRPAR>`, `</GRLAB>`, `</SEMDB>`, `</CLASS>`, and `</PAIRS>`.

### Parse-tree completion rules {#parse-tree-completion-rules}

Section `<GRPAR>` contains rules to complete the partial parsing provided by the chart parser. The tree is completed by combining chunk pairs as stated by the rules. Rules are applied from highest priority (lower values) to lowest priority (higher values), and left-to right. That is, the pair of adjacent chunks matching the most prioritary rule is found, and the rule is applied, joining both chunks in one. The process is repeated until only one chunk is left.

The rules can be enabled/disabled via the activation of global flags. Each rule may be stated to be enabled only if certain flags are on. If none of its enabling flags are on, the rule is not applied. Each rule may also state which flags have to be toggled on/off after its application, thus enabling/disabling other rule subsets.

Each line contains a rule, with the format:

<pre>  priority flags context (lchunk,rchunk) pair-constraints operation op-params flag-ops
</pre>

where:

*   `priority` is a number stating the priority of a rule (the lower the number, the higher the priority).
*   `flags` is a list of strings separated by vertical bars (```|`''). Each string is the name of a flag that will cause the rule to be enabled. If `enabling_flags` equals ```-`'', the rule will be always enabled.
*   `context` is a context limiting the application of the rule only to chunk pairs that are surrounded by the appropriate context (```-`'' means no limitations, and the rule is applied to any matching chunk pair) (see below).
*   `(lchunk,rchunk)` are the labels of the adjacent pair of chunks the rule will be applied to. The labels are either assigned by the chunk parser, or by a `RELABEL` operation on some other completion rule. The pair must be enclosed in parenthesis, separated by a comma, and contain NO whitespaces.

    The chunk labels may be suffixed with one extra condition of the form: `(form)`, `<lemma>`, `[class]`, or `{PoS_regex}`.

    For instance,

    | The label: | Would match: |
    | --- | --- |
    | `np` | any chunk labeled `np` by the chunker |
    | `np(cats)` | any chunk labeled `np` by the chunker |
    |   | with a head word with form `cats` |
    | `np<cat>` | any chunk labeled `np` by the chunker |
    |   | with a head word with lemma `cat` |
    | `np[animal]` | any chunk labeled `np` by the chunker |
    |   | with a head word with a lemma in `animal` |
    |   | category (see `CLASS` section below) |
    | `np{^N.M}` | any chunk labeled `np` by the chunker |
    |   | with a head word with a PoS tag matching |
    |   | the `^N.M` regular expression |

*   `pair-constraits` expresses a constraint that must be satisfied by the `(lchunk,rchunk)` chunks. If no constraints are required, this field must be a dash: ```-`''. The format of the constraint is `pairclass::(value1,value2)`, where:
    *   `pairclass` is the name of a pair class defined in the `<PAIRS>` section (see subsection

        4.21.1

        ).
    *   `value1` and `value2` are the two values that must belong to the pair class.

        Each `value` specifies whether the value is to be extracted from `lchunk` (`L`) or `rchunk` (`R`), the path to or a node below them (if target is not the root), and the attribute to extract.

        For instance, `L.lemma` specifies the lemma of the head word of `lchunk`. `R:sn.pos` specifies the PoS tag of the head word of a node with label `sn` located under `rchunk`. `R:sp:sn.semfile` specifies the semantic file of the head word of a node with label `sn` located under a node with label `sp` located under `rchunk`.

        Valid attributes are: `lemma`, `pos`, `semfile`, `tonto`, `synon`, `asynon`. Their meaning is the same than for dependency labeling rules, and is described in subsection

        4.21.1

        .

*   `operation` is the way in which `lchunk` and `rchunk` nodes are to be combined (see below).*   The `op-params` component has two meanings, depending on the `operation` field: `top_left` and `top_right` operations must be followed by the literal `RELABEL` plus the new label(s) to assign to the chunks. Other operations must be followed by the literal `MATCHING` plus the label to be matched.

    For `top_left` and `top_right` operations the labels following the keyword `RELABEL` state the labels with which each chunk in the pair will be relabelled, in the format `label1:label2`. If specified, `label1` will be the new label for the left chunk, and `label2` the one for the right chunk. A dash ( ```-`'') means no relabelling. In none of both chunks is to be relabelled, ```-`'' may be used instead of ```-:-`''. For example, the rule: `20 - - (np,pp<of>) top_left RELABEL np-of:- -` will hang the `pp` chunk as a daughter of the left chunk in the pair (i.e. `np`), then relabel the `np` to `np-of`, and leave the label for the `pp` unchanged.

    For `last_left`, `last_right` and `cover_last_left` operations, the label following the keyword `MATCHING` states the label that a node must have in order to be considered a valid ``last'' and get the subtree as a new child. This label may carry the same modifying suffixes than the chunk labels. If no node with this label is found in the tree, the rule is not applied. For example, the rule: `20 - - (vp,pp<of>) last_left MATCHING np -` will hang the `pp` chunk as a daughter of the last subtree labeled `np` found inside the `vp` chunk.

    *   The last field `flag-ops` is a space-separated list of flags to be toggled on/off. The list may be empty (meaning that the rule doesn't change the status of any flag). If a flag name is preceded by a ```+`'', it will be toggled on. If the leading symbol is a ```-`'', it will be toggled off.

For instance, the rule:

<pre>  20 - - (np,pp<of>) top_left RELABEL - -
</pre>

states that if two subtrees labelled `np` and `pp` are found contiguous in the partial tree, and the second head word has lemma `of`, then the later (rightmost) is added as a new child of the former (leftmost), whatever the context is, without need of any special flag active, and performing no relabelling of the new tree root.

The supported tree-building operations are the following:

*   `top_left`: The right subtree is added as a daughter of the left subtree. The root of the new tree is the root of the left subtree. If a `label` value other than ```-`'' is specified, the root is relabelled with that string.
*   `last_left`: The right subtree is added as a daughter of the last node inside the left subtree matching `label` value (or to the root if none is found). The root of the new tree is the root of the left subtree.
*   `top_right`: The left subtree is added as a new daughter of the right subtree. The root of the new tree is the root of the right subtree. If a `label` value other than ```-`'' is specified, the root is relabelled with that string.
*   `last_right`: The left subtree is added as a daughter of the last node inside the right subtree matching `label` value (or to the root if none is found). The root of the new tree is the root of the right subtree.
*   `cover_last_left`: The left subtree (_s_) takes the position of the last node (_x_) inside the right subtree matching `label` value. The node _x_ is hanged as new child of _s_. The root of the new tree is the root of the right subtree.

The context may be specified as a sequence of chunk labels, separated by underscores ```_`''. One of the chunk labels must be `$$`, and refers to the pair of chunks which the rule is being applied to.

For instance, the rule:

<pre>   20 - $_vp (np,pp<of>) top_left RELABEL -
</pre>

would add the rightmost chunk in the pair (`pp<of>`) under the leftmost (`np`) only if the chunk immediate to the right of the pair is labeled `vp`.

Other admitted labels in the context are: `?` (matching exactly one chunk, with any label), `*` (matching zero or more chunks with any label), and `OUT` (matching a sentence boundary).

For instance the context `np_$$_*_vp_?_OUT` would match a sentence in which the focus pair of chunks is immediately after an `np`, and the second-to-last chunk is labeled `vp`.

Context conditions can be globally negated preceding them with an exclamation mark (`!`). E.g. `!np_$$_*_vp` would cause the rule to be applied only if that particular context is not satisfied.

Context condition components may also be individually negated preceding them with the symbol `~`. E.g. the rule `np_$$_~vp` would be satisfied if the preceding chunk is labeled `np` and the following chunk has any label but `vp`.

Enabling flags may be defined and used at the grammarian's will. For instance, the rule:

<pre>20 INIT|PH1 $_vp (np,pp<of>) last_left MATCHING npms[animal] +PH2 -INIT -PH1
</pre>

Will be applied if either `INIT` or `PH1` flags are on, the chunk pair is a `np` followed by a `pp` with head lemma `of`, and the context (one `vp` chunk following the pair) is met. Then, the deepest rightmost node matching the label `npms[animal]` will be sought in the left chunk, and the right chunk will be linked as one of its children. If no such node is found, the rule will not be applied.

After applying the rule, the flag `PH2` will be toggled on, and the flags `INIT` and `PH1` will be toggled off.

The only predefined flag is `INIT`, which is toggled on when the parsing starts. The grammarian can define any alphanumerical string as a flag, simply toggling it on in some rule.

### Dependency function labeling rules {#dependency-function-labeling-rules}

.

Section `<GRLAB>` contains two kind of lines.

The first kind are the lines defining `UNIQUE` labels, which have the format:

<pre>  UNIQUE label1 label2 label3 ...
</pre>

You can specify many `UNIQUE` lines, each with one or more labels. The effect is the same than having all of them in a single line, and the order is not relevant.

Labels in `UNIQUE` lists will be assigned only once per head. That is, if a head has a daugther with a dependency already labeled as `label1`, rules assigning this label will be ignored for all other daugthers of the same head. (e.g. if a verb has got a `subject` label for one of its dependencies, no other dependency will get that label, even if it meets the conditions to do so).

The second kind of lines state the rules to label the dependences extracted from the full parse tree build with the rules in previous section:

Each line contains a rule, with the format:

<pre>  ancestor-label dependence-label condition1 condition2 ...
</pre>

where:

*   `ancestor-label` is the label of the node which is head of the dependence.
*   `dependence-label` is the label to be assigned to the dependence
*   `condition` is a list of conditions that the dependence has to match to satisfy the rule.

Each `condition` has one of the forms:

<pre>  node.attribute = value
  node.attribute != value
</pre>

Where `node` is a string describing a node on which the `attribute` has to be checked. The `value` is a string to be matched, or a set of strings (separated by ```|`''). The strings can be right-wildcarded (e.g. `np*` is allowed, but not `n*p`. For the `pos` attribute, `value` can be any valid regular expression.

The `node` expresses a path to locate the node to be checked. The path must start with `p` (parent node) or `d` (descendant node), and may be followed by a colon-separated list of labels. For instance `p:sn:n` refers to the first node labeled `n` found under a node labeled `sn` which is under the dependency parent `p`.

The `node` may be also `As` (All siblings) or `Es` (Exists sibling) which will check the list of all children of the ancestor (`p`), excluding the focus daughter (`d`). `As` and `Es` may be followed by a path, just like `p` and `d`. For instance, `Es:sn:n` will check for a sibling with that path, and `As:sn:n` will check that all sibling have that path.

The `node` may be also a pair of the form `[node1.attribute,node2.attribute]` where `node1` and `node2` can be a node path (e.g. `p:sn:n`, `p`, etc) but not `As`,`Es`, or another pair. In this case, the attributes for `node1` and `node2` can only be one of `label`, `lemma`, or `pos`. Finally, the attribute for such a pair node can be only `pairclass`.

Possible <tt>attribute</tt> to be used:

*   `label`: chunk label (or PoS tag) of the node.
*   `side`: (left or right) position of the specified node with respect to the other. Only valid for `p` and `d`.
*   `lemma`: lemma of the node head word.
*   `pos`: PoS tag of the node head word
*   `class`: word class (see below) of lemma of the node head word.
*   `tonto`: EWN Top Ontology properties of the node head word.
*   `semfile`: WN semantic file of the node head word.
*   `synon`: Synonym lemmas of the node head word (according to WN).
*   `asynon`: Synonym lemmas of the node head word ancestors (according to WN).
*   `pairclass`: Only applicable to pair nodes. Check whether the pair is in any of specified classes.

Note that since no disambiguation is required, the attributes dealing with semantic properties will be satisfied if any of the word senses matches the condition.

For instance, the rule:

<pre>verb-phr    subj    d.label=np*      d.side=left
</pre>

states that if a `verb-phr` node has a daughter to its left, with a label starting by `np`, this dependence is to be labeled as `subj`.

Similarly, the rule:

<pre>verb-phr    obj    d.label=np*  d:sn.tonto=Edible  p.lemma=eat|gulp
</pre>

states that if a `verb-phr` node has <tt>eat</tt> or <tt>gulp</tt> as lemma, and a descendant with a label starting by `np` and containing a daughter labeled `sn` that has <tt>Edible</tt> property in EWN Top ontology, this dependence is to be labeled as `obj`.

Another example:

<pre>verb-phr    iobj   d.label=pp* d.lemma=to|for  Es.label=np*
</pre>

states that if a `verb-phr` has a descendant with a label starting by `pp` (prepositional phrase) and lemma to or for, and there is another child of the same parent which is a noun phrase (`np*`), this dependence is to be labeled as `iobj`.

Yet another:

<pre>verb-phr    dobj   d.label=pp* d.lemma=to|for  As.label!=np*
</pre>

states that if a `verb-phr` has a descendant with a label starting by `pp` (prepositional phrase) and lemma to or for, and all the other children of the same parent are not noun phrases (`np*`), this dependence is to be labeled as `dobj`.

And some examples for `pairclass`:

<pre>verb-phr dobj d.label=noun-phr* d.side=right [p.lemma,d.lemma].pairclass=direct
verb-phr loc d.label=pp* d.lemma=in|at d.side=right [p.lemma,d:noun-phr.lemma].pairclass=location
</pre>

First rule above states that a `noun-phr` daughter under a `verb-phr` parent will be labeled as `dobj` if it is to the right of its parent, and the pair formed by their lemmas is found in the `direct` pair class (which should be defined in section `<PAIRS>` as described below).

The second rule states that a `pp` daughter under a `verb-phr` parent will be labeled as `loc` if it is to the right of its parent, the preposition heading the `pp` is one of `in|at`, and the pair formed by the verb lemma and the noun heading the noun phrase inside the `pp` is found in the `location` pair class (which should be defined in section `<PAIRS>` as described below).

### Semantic database location {#semantic-database-location}

Section `<SEMDB>` is only necessary if the dependency labeling rules in section `<GRLAB>` use conditions on semantic values (that is, any of `tonto`, `semfile`, `synon`, or `asynon`). Since it is needed by `<GRLAB>` rules, section `<SEMDB>` must be defined before section `<GRLAB>`. The section must contain a single line specifying a configuration file for a semanticDB object. The filename may be absolute or relative to the location of the dependency rules file.

<pre><SEMDB>
../semdb.dat
</SEMDB>
</pre>

The configuration file must follow the format described in section

5.2

.

### Class definitions {#class-definitions}

Section `<CLASS>` contains class definitions which may be used as attributes in the dependency labelling rules.

Each line contains a class assignation for a lemma, with two possible formats:

<pre>  class-name  lemma      comments
  class-name  "filename"   comments
</pre>

For instance, the following lines assign to the class `mov` the four listed verbs, and to the class `animal` all lemmas found in `animals.dat` file. In the later case, if the file name is not an absolute path, it is interpreted as a relative path based at the location of the rule file.

Anything to the right of the second field is considered a comment and ignored.

<pre>mov     go      prep= to,towards
mov     come    prep= from
mov     walk    prep= through
mov     run     prep= to,towards   D.O.

animal "animals.dat"
</pre>

### Pair-class definitions {#pair-class-definitions}

Section `<PAIRS>` contains class definitions of compatible pairs. They can be used as attributes in the tree-completing rules.

Each line contains a class assignation for a pair, with two possible formats:

<pre>  class-name  element1 element2
  class-name  "filename"
</pre>

For instance, the following lines assign to the class `material` the two first pairs, to the class `location` the third and fourth pair, and to class `food"` all pairs found in `food.dat` file. In the later case, if the file name is not an absolute path, it is interpreted as a relative path based at the location of the rule file. The contents of the file must be a list of pairs (one per line).

No comments are allowed in the same line than a pair.

<pre>material   table wood
material   knife steel
location   tree forest
location   car road

food    "food.dat"
</pre>

These pair classes may be used by tree-completion rules to set constraints to check whether two chunks must be joined or not, and by labeling rules to check whether a head and its dependant have a certain type of relation.

# Statistical Dependency Parser and Semantic Role Labelling Module {#statistical-dependency-parser-and-semantic-role-labelling-module}

As an alternative to rule-based Txala dependency parser, a statistical dependency parsing module is also available. It is based on Treeler machine learning library

<sup><span class="arabic">4</span>.<span class="arabic">3</span></sup>

.

The API of the class is the following:

<pre>class dep_treeler : public dependency_parser {
 public:   
   /// constructor
   dep_treeler(const std::string &cfgfile);
   /// destructor
   ~dep_treeler();

   /// analyze given sentence.
   void analyze(sentence &s) const;

   /// analyze given sentences.
   void analyze(std::list<sentence> &ls) const;

   /// return analyzed copy of given sentence
   sentence analyze(const sentence &s) const;

   /// return analyzed copy of given sentences
   std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The constructor to class <tt>dep_treeler</tt> expects a configuration file with the contents described below.

The module can perform not only dependency parsing, but also semantic role labelling (SRL) if it has been trained to do so.

The configuration file establishes whether both tasks are performed, or just dependency parsing.

## Statistical Parser and SRL Configuration File {#statistical-parser-and-srl-configuration-file}

The configuration file for the statistical dependency parser and semantic role labelling module has two main sections: `<Dependencies>` and `<SRL>`. Each section establishes the configuration and parameters of the corresponding subtask. Section `<Dependencies>` is required, but section `<SRL>` may be ommitted if no SRL is required.

Section `<Dependencies>` contains two lines, with a keyword and a value each:

The `DependencyTreeler` keyword should be followed by a path to a Treeler configuration file with the dependency parsing model to use. The path may be either absolute or relative to the Statistical Parser and SRL configuration file.

The `Tagset` keyword should be followed by a path to a Tagset definition file (see section 

5.1

) which will be used to convert the input PoS tags to the short versions and MSD features expected by the Treeler model.

An example of the `<Dependencies>` section:

<pre><Dependencies>
## treeler config file for dep parser
DependencyTreeler ./dep/config.dat

## Tagset description file
Tagset ./tagset.dat
</Dependencies>
</pre>

Section `<SRL>` contains also keyword-value lines, which may be of 4 different types:

*   `Predicates`: Lines stating a PoS and a list of files containing associations between senses as output by the sense annotation modules (e.g. WN synsets). See sections 

    4.15

    and

    4.16

    . If the sentence word sense is contained in one of the lists, the word is considered as a predicate for SRL, and its sense number and argument pattern are retrieved from the list. An asterisk may be added to the end of the line indicating that words not found in any list, but with the appropriate PoS, should be considered predicates too.
*   `PredicateException`: This lines list specific cases of words that should not be considered predicates, even if they satisfy some of the conditions of a `Predicates` line. An additional PoS may be added, meaning that the exception holds only if the target word has a dependant with that PoS. This is typically used to exclude auxiliary verbs from being considered predicates (e.g. if there is a `Predicates` rule that would consider any verb as a predicate).
*   `DefaultArgs`: List of labels for the argument frame to be used for predicates not found in any list (but considered predicates because some `Predicates` line had an asterisk).
*   `SRLTreeler`: This keyword must be followed by a path to a Treeler configuration file with the SRL model to use. The path may be either absolute or relative to the Statistical Parser and SRL configuration file.

An example of the `<SRL>` section:

<pre><SRL>
## Files containing conversion synset->predicate->argument list
## Each PoS admits a list of files, checked in cascade.
## Asterisc means any word with that PoS will be a predicate, 
## even if it is not in any list. In that case, predicate  number 
## will be ``.00'' and arguments will be those in ``DefaultArgs''
Predicates V ../../common/pred-verb.dat *
Predicates N ../../common/pred-nom.dat

## Execptions: words that are NOT predicates, even if they are 
## accepted by rules above (e.g. matched an asterisc). 
## The execption holds only if the word has a daugher with given PoS.
PredicateException V:have V
PredicateException V:be V
PredicateException V:do V

## arguments for predicates not found in the list (e.g. accepted
## by an asterisc)
DefaultArgs A0 A1 A2 A3

## If you do not need SRL, comment out SRLTreeler line or remove section <SRL>
## treeler config file for SRL
SRLTreeler ./srl/config.dat
</SRL>
</pre>

# R<small>ELAX</small>C<small>OR</small> Coreference Resolution Module {#relaxcor-coreference-resolution-module}

This module offers coreference resolution capabilities.

The API to this module is:

```C++
class relaxcor {
  public:

    /// Constructor
    relaxcor(const std::wstring &fconfig);
    /// Destructor
    ~relaxcor();

   /// Finds the coreferent mentions in a document
    void analyze(document&) const;
  };
```

The module constructor expects a configuration file that define which resources to load and parameters to use. This file also defines which are the configuration files for several sub-modules (mention detection, feature extraction, etc).

Once created, the module can be given a document (which in general should be fully analyzed with shallow parsing, dependency parsing, NEC, WSD, and SRL) and it will enrich the document metadata with coreference information.

Note that this module can only process whole documents, and not single sentences or paragraphs as the other modules, since coreference is a document-level phenomenon.

# Semantic Graph Extractor Module {#semantic-graph-extractor-module}

This module will combine the information provided by the parser, the SRL, and the coreference resolution modules, and build a semantic graph encoding which events are described in the text, which are the relations between them, and which are the actors participating in those events.

```C++
class semgraph_extract {

  public:
    /// Constructor   
    semgraph_extract(const std::wstring &CfgFile);    
    /// Destructor   
    ~semgraph_extract();

    /// extract graph from given document
    void extract(freeling::document &doc) const;

  };
```

This module will enrich the document with an object <tt>semantic_graph</tt> containing a pseudo entity-relationship model of the events described in the text.

For instance, for the text: Mary says that Peter Smith bought a car that runs fast. Peter loves Mary. FreeLing would produce the following graph:

```XML
<semantic_graph>
   <entity id="E1" lemma="mary" class="person">
      <mention id="t1.1" words="Mary" />
      <mention id="t2.3" words="Mary" />
   </entity>
   <entity id="E2" lemma="peter_smith" class="person" >
      <mention id="t1.4" words="Peter_Smith" />
      <mention id="t2.1" words="Peter" />
   </entity>
   <entity id="W6" lemma="car" sense="02958343-n" >
      <mention id="t1.7" words="a car that runs fast" />
      <synonym lemma="auto"/>
      <synonym lemma="automobile"/>
      <synonym lemma="car"/>
      <synonym lemma="machine"/>
      <synonym lemma="motorcar"/>
      <URI knowledgeBase="WordNet" 
           URI="http://wordnet-rdf.princeton.edu/wn30/02958343-n"/>
      <URI knowledgeBase="OpenCYC" 
           URI="http://sw.opencyc.org/concept/Mx4rvViVwZwpEbGdrcN5Y29ycA"/>
      <URI knowledgeBase="SUMO" 
           URI="http://ontologyportal.org/SUMO.owl#Automobile"/>
   </entity>
   <entity id="W8" lemma="fast" sense="00086000-r" >
      <mention id="t1.10" words="fast" />
      <synonym lemma="fast"/>
      <URI knowledgeBase="WordNet" 
           URI="http://wordnet-rdf.princeton.edu/wn30/00086000-r"/>
      <URI knowledgeBase="SUMO" 
           URI="http://ontologyportal.org/SUMO.owl#SubjectiveAssessmentAttribute"/>
   </entity>
   <frame id="F3" token="t1.2" lemma="say.00" sense="00928959-v" >
      <argument role="A0" entity="E1" />
      <argument role="A1" entity="F4" />
      <synonym lemma="say"/>
      <URI knowledgeBase="WordNet" 
           URI="http://wordnet-rdf.princeton.edu/wn30/00928959-v"/>
      <URI knowledgeBase="SUMO" 
           URI="http://ontologyportal.org/SUMO.owl#Process"/>
   </frame>
   <frame id="F4" token="t1.5" lemma="purchase.01|buy.01" sense="02207206-v" >
      <argument role="A0:Agent" entity="E2" />
      <argument role="A1:Theme" entity="W6" />
      <synonym lemma="buy"/>
      <synonym lemma="purchase"/>
      <URI knowledgeBase="WordNet" 
           URI="http://wordnet-rdf.princeton.edu/wn30/02207206-v"/>
      <URI knowledgeBase="OpenCYC" 
           URI="http://sw.opencyc.org/concept/Mx4rvVjL2pwpEbGdrcN5Y29ycA"/>
      <URI knowledgeBase="SUMO" 
           URI="http://ontologyportal.org/SUMO.owl#Buying"/>
   </frame>
   <frame id="F5" token="t1.9" lemma="run.00" sense="01926311-v" >
      <argument role="A0" entity="W6" />
      <argument role="AM-MNR" entity="W8" />
      <synonym lemma="run"/>
      <URI knowledgeBase="WordNet" 
           URI="http://wordnet-rdf.princeton.edu/wn30/01926311-v"/>
      <URI knowledgeBase="OpenCYC" 
           URI="http://sw.opencyc.org/concept/Mx4rvVjkGpwpEbGdrcN5Y29ycA"/>
      <URI knowledgeBase="SUMO" 
           URI="http://ontologyportal.org/SUMO.owl#Running"/>
   </frame>
   <frame id="F9" token="t2.2" lemma="love.01" sense="01775164-v" >
      <argument role="A0:Experiencer" entity="E2" />
      <argument role="A1:Stimulus" entity="E1" />
      <synonym lemma="love"/>
      <URI knowledgeBase="WordNet" 
           URI="http://wordnet-rdf.princeton.edu/wn30/01775164-v"/>
      <URI knowledgeBase="SUMO" 
           URI="http://ontologyportal.org/SUMO.owl#wants"/>
   </frame>
</semantic_graph>
```

The graph encodes that there are three entities in the text (``Peter'', ``Mary'', and ``a car''). Some of them are mentioned more than once (and so, they participate in different events described in the text). Some of them have a class (e.g. ``person'') or a link to an external ontology (such as WN, SUMO, or OpenCYC).

Then, there are some events (or ``frames'') described in the text. Those frames have arguments, which are the involved actors. External URIs for the semantic of those actions are also provided.

So the main relations in this graph are:

*   Frame <tt>F9</tt> describes a <tt>love.01</tt> event experienced by entity <tt>E2</tt> (Mary) due to the stimulus of entity <tt>E1</tt> (Peter).
*   Frame <tt>F5</tt> describes a <tt>run.00</tt> event performed by entity <tt>W6</tt> (a car). This event has a manner argument that is <tt>W8</tt> (fast).
*   Frame <tt>F4</tt> describes a <tt>purchase.01|buy.01</tt> event performed by <tt>E2</tt> (Peter) on <tt>W6</tt> (a car).
*   Frame <tt>F3</tt> describes a <tt>say.00</tt> event where <tt>E1</tt> (Mary) states that event <tt>F4</tt> (Peter buying a car) happened.

# Analyzer metamodule {#analyzer-metamodule}

Although FreeLing is a toolbox with a variety of modules to pick and choose from for specific uses, most applications are likely to need a text analisys pipeline that goes from raw text to certain level of annotation.

To ease the construction of applications that call FreeLing, the <tt>analyzer</tt> metamodule has been included. This metamodule implements a pipeline calling a standard sequence of FreeLing modules: Tokenizer, splitter, morphological analyzer, PoS tagger, sense annotation, WSD, NEC, parsing, SRL, coreferences.

A set of customizable options in this module allows the calling application to control the start and ending levels of the pipeline (e.g. from text to shallow parsing, or from tagged input to coreferences...), as well as which modules are turned on/off and with which configuration files are they loaded.

Thus, different instances of this class can be created using different option sets to get analyzers for different languages or different tasks.

The API of the class is the following:

```C++
class analyzer {
 public:
   typedef analyzer_config_options config_options;
   typedef analyzer_invoke_options invoke_options;

   /// constructor, given a set of creation options
   analyzer(const config_options &cfg);

   /// Destructor
   ~analyzer();

   /// get current execution options
   const invoke_options& get_current_invoke_options() const;

   /// change execution options for next call
   void set_current_invoke_options(const invoke_options &opt, bool check=true);

   /// analyze text as a whole document.
   /// 'parag' indicates whether a blank line is to be considered a paragraph 
   /// separator.
   void analyze(const wstring &text, document &doc, bool parag=false) const;

   /// Analyze text as a partial document. Retain incomplete sentences in buffer   
   /// in case next call completes them (except if flush==true)
   void analyze(const wstring &text, std::list<sentence> &ls, bool flush=false);

   /// analyze further levels on a partially analyzed document
   void analyze(document &doc) const;

   /// analyze further levels on partially analyzed sentences
   void analyze(std::list<sentence> &ls) const;

   /// flush splitter buffer and analyze any pending text. 
   void flush_buffer(std::list<sentence> &ls);

   /// Reset tokenizer byte offset counter to 0.
   void reset_offset();
};
```

The constructor expects a set of configuration options (see `class analyzer::config_options` below) which specifiy creation-time options for all modules that need to be loaded. These options are basically configuration and data files to load.

The `analyzer` meta-module will create all modules for which a configuration file is specified. If a module does not need to be created, the corresponding option in `analyzer::config_options` should be empty.

Once the `analyzer` instance is created, a set of invocation options must be specified (see description of class `analyzer::invoke_options` below) . Invocation options are run-time options and can be altered for each analysis if necessary (e.g. if one needs to apply different processes to different kinds of input texts). They include activating/deactivating modules or changing the initial/final points in the pipeline.

When invoke options are set, the `analyzer` meta-module can be called to process a plain text, or to enrich a partially analyzed document.

## Analyzer configuration options {#analyzer-configuration-options}

Class `analyzer::config_options` contains the configuration options that define which modules are active and which configuration files are loaded for each of them at construction time. Options in this set can not be altered once the analyzer is created. If an option has an empty value, the corresponding module will not be created (and thus it will not be possible to call it just altering `invoke_options` later)

```C++
class analyzer::config_options {
  public:
     /// Language of text to process
     std::wstring Lang;

     /// Tokenizer configuration file
     std::wstring TOK_TokenizerFile;

     /// Splitter configuration file
     std::wstring SPLIT_SplitterFile;

     /// Morphological analyzer options
     std::wstring MACO_Decimal, MACO_Thousand;
     std::wstring MACO_UserMapFile, MACO_LocutionsFile,   MACO_QuantitiesFile,
                  MACO_AffixFile,   MACO_ProbabilityFile, MACO_DictionaryFile, 
                  MACO_NPDataFile,  MACO_PunctuationFile, MACO_CompoundFile;   	 
     double MACO_ProbabilityThreshold;

     /// Phonetics config file
     std::wstring PHON_PhoneticsFile;

     /// NEC config file
     std::wstring NEC_NECFile;

     /// Sense annotator and WSD config files
     std::wstring SENSE_ConfigFile;
     std::wstring UKB_ConfigFile;

     /// Tagger options
     std::wstring TAGGER_HMMFile;
     std::wstring TAGGER_RelaxFile;
     int TAGGER_RelaxMaxIter;
     double TAGGER_RelaxScaleFactor;
     double TAGGER_RelaxEpsilon;
     bool TAGGER_Retokenize;
     ForceSelectStrategy TAGGER_ForceSelect;

     /// Chart parser config file
     std::wstring PARSER_GrammarFile;

     /// Dependency parsers config files
     std::wstring DEP_TxalaFile;   
     std::wstring DEP_TreelerFile;   

     /// Coreference resolution config file
     std::wstring COREF_CorefFile;

     /// semantic graph extractor config file
     std::wstring SEMGRAPH_SemGraphFile;
};
```

## Analyzer invocation options {#analyzer-invocation-options}

Class `analyzer::invoke_options` contains the options that define the behaviour of each module in the analyze on the all subsequent analysis (until invoke options are changed again) Options in this set can be altered after construction (e.g. to activate/deactivate certain modules), as many times as needed.

Values for this options need to be consistent with configuration options used to create the analyzer (e.g. it is not possible to activate a module that has not been loaded at creation time)

```C++
class analyzer_invoke_options {
   public:
     /// Level of analysis in input and output
     AnalysisLevel InputLevel, OutputLevel;

     /// activate/deactivate morphological analyzer modules
     bool MACO_UserMap, MACO_AffixAnalysis, MACO_MultiwordsDetection, 
          MACO_NumbersDetection, MACO_PunctuationDetection, 
          MACO_DatesDetection, MACO_QuantitiesDetection, 
          MACO_DictionarySearch, MACO_ProbabilityAssignment, MACO_CompoundAnalysis,
          MACO_NERecognition, MACO_RetokContractions;

     /// activate/deactivate phonetics
     bool PHON_Phonetics;

     /// activate/deactivate NEC
     bool NEC_NEClassification;

     /// Select which WSD to use (NO_WSD,ALL,MFS,UKB)
     WSDAlgorithm SENSE_WSD_which;

     /// Select which tagger to use (NO_TAGGER,HMM,RELAX)
     TaggerAlgorithm TAGGER_which;

     /// Select which dependency parser to use (NO_DEP,TXALA,TREELER)
     DependencyParser DEP_which;    
};
```

# Other useful modules {#other-useful-modules}

FreeLing contains some internal classes used by the analysis modules described in Chapter 

4

, and other utility classes (e.g. to handle input/output formats).

Some applications may be interested in directly accessing these lower-level utilities, the most relevant of which are described in this chapter.

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

# Semantic Database Module {#semantic-database-module}

This module is not a main processor in the default analysis chain, but it is used by the other modules that need access to the semantic database: The sense annotator <tt>senses</tt>, the word sense disambiguator <tt>ukb_wrap</tt>, the dependency parser <tt>dep_txala</tt>, and the coreference solver <tt>coref</tt>.

Moreover, this module can be used by the applications to enrich or post process the results of the analysis.

The API for this module is

```C++
class semanticDB {
  public:
    /// Constructor
    semanticDB(const std::string &); 

    /// Compute list of lemma-pos to search in WN for given word,
    /// according to mapping rules.
    void get_WN_keys(const std::wstring &, 
                     const std::wstring &, 
                     const std::wstring &,
                     std::list<std::pair<std::wstring,std::wstring> > &) const;

    /// get list of words for a sense+pos
    std::list<std::string> get_sense_words(const std::string &, 
                                           const std::string &) const;

    /// get list of senses for a lemma+pos
    std::list<std::string> get_word_senses(const std::string &, 
                                           const std::string &) const;

    /// get sense info for a sensecode+pos
    sense_info get_sense_info(const std::string &, const std::string &) const;
};
```

The constructor receives a configuration file, with the following contents:

*   A section `<WNPosMap>` which establishes which PoS found in the morphological dictionary should be mapped to each WN part-of-speech. Rule format is described in section

    5.2.1

    .
*   A section `<DataFiles>` specifying the knowledge bases required by the algorithm. This section may contain up to three keywords, with the format:

    <pre>    <DataFiles>
        senseDictFile  ./senses30.src
        wnFile  ../common/wn30.src
        formDictFile  ./dicc.src
        </DataFiles>
    </pre>

    `senseDictFile` is the sense repository, with the format described in section

    5.2.2

    .

`wnFile` is a file stating hyperonymy relations and other semantic information for each sense. The format is described in section

5.2.3

.

`formDictFile` may be needed if mapping rules in `<WNPosMap>` require it. It is a regular form file with morphological information, as described in section

4.9

.

## PoS mapping rules {#pos-mapping-rules}

Each line in section `<WNPosMap>` defines a mapping rule, with format `FreeLing-PoS WN-PoS search-key`, where `FreeLing-PoS` is a prefix for a FreeLing PoS tag, `WN-Pos` must be one of <tt>n</tt>, <tt>a</tt>, <tt>r</tt>, or <tt>v</tt>, and `search-key` defines what should be used as a lemma to search the word in WN files.

The given `search-key` may be one of <tt>L</tt>, <tt>F</tt>, or a FreeLing PoS tag. If <tt>L</tt> (<tt>F</tt>) is given, the word lemma (form) will be searched in WN to find candidate senses. If a FreeLing PoS tag is given, the form for that lemma with the given tag will be used.

Example 1: For English, we could have a mapping like:

<pre>    <WNposMap>
    N n L
    J a L
    R r L
    V v L
    VBG a F
    </WNposMap>
</pre>

which states that for words with FreeLing tags starting with <tt>N</tt>, <tt>J</tt>, <tt>R</tt>, and <tt>V</tt>, lemma will be searched in wordnet with PoS <tt>n</tt>, <tt>a</tt>, <tt>r</tt>, and <tt>v</tt> respectively. It also states that words with tag <tt>VBG</tt> (e.g. boring) must be searched as adjectives (<tt>a</tt>) using their form (that is, boring instead of lemma bore). This may be useful, for instance, if FreeLing English dictionary assigns to that form a gerund analysis (bore VBG) but not an adjective one.

Example 2: A similar example for Spanish, could be:

<pre>     <WNposMap>
     N n L
     A a L
     R r L
     V v L
     VMP a VMP00SM
     </WNposMap>
</pre>

which states that for words with FreeLing tags starting with <tt>N</tt>, <tt>A</tt>, <tt>R</tt>, and <tt>V</tt>, lemma will be searched in wordnet with PoS <tt>n</tt>, <tt>a</tt>, <tt>r</tt>, and <tt>v</tt> respectively. It also states that words with tag starting with <tt>VMP</tt> (e.g. cansadas) must be searched as adjectives (<tt>a</tt>) using the form for the same lema (i.e. cansar) that matches the tag <tt>VMP00SM</tt> (resulting in cansado). This is useful to have participles searched as adjectives, since FreeLing Spanish dictionary doesn't contain any participle as adjective, but esWN does.

## Sense Dictionary File {#sense-dictionary-file}

This source file (e.g. <tt>senses30.src</tt> provided with FreeLing) must contain the word list for each synset, one entry per line. Each line has format: <tt>sense word1 word2 ...</tt>.

E.g. `00045250-n actuation propulsion` `00050652-v assume don get_into put_on wear`

Sense codes can be anything (assuming your later processes know what to do with them) provided they are unambiguous (there are not two lines with the same sense code). The files provided in FreeLing contain WordNet 3.0 synset codes.

## WordNet file {#wordnet-file}

This source file (e.g. <tt>wn30.src</tt> provided with FreeLing) must contain at each line the information relative to a sense, with the following format:

<pre>sense hypern:hypern:...:hypern  semfile  TopOnto:TopOnto:...:TopOnto  sumo  cyc
</pre>

That is: the first field is the sense code. The following fields are:

*   A colon-separated list of hypernym synsets.
*   WN semantic file the synset belongs to.
*   A colon-separated list of EuroWN TopOntology codes valid for the synset.
*   A code for an equivalent (or near) concept in SUMO ontology. See SUMO documentation for a description of the code syntax.
*   A code for an equivalent concept in CyC ontology.

Note that the only WN relation encoded here is hypernymy. Note also that semantic codes such as WN semantic file or EWN TopOntology features are simply (lists of) strings. Thus, you can include in this file any ontological or semantic information you need, just substituing the WN-related codes by your own semantic categories.

# Approximate search dictionary {#approximate-search-dictionary}

This class wraps a <tt>libfoma</tt> FSM and allows fast retrieval of similar words via string edit distance based search.

The API of the class is the following:

```C++
class foma_FSM {

  public:
    typedef enum {FSM_DICC,FSM_COMPOUNDS} FSM_Type;

    /// build automaton from file
    foma_FSM(const std::wstring &, 
             FSM_Type type=FSM_DICC, 
             const std::wstring &mcost=L""); 
    /// clear 
    ~foma_FSM();

    /// Use automata to obtain closest matches to given form, 
    /// and add them to given list.
    void get_similar_words(const std::wstring &, 
                           std::list<std::pair<std::wstring,int> > &) const;    
    /// set maximum edit distance of desired results
    void set_cutoff_threshold(int);
    /// set maximum number of desired results
    void set_num_matches(int);
    /// Set cost for basic SED operations (insert, delete, substitute)
    void set_basic_operation_cost(int);
    /// Set cost for a particular SED operation (replace "in" with "out")
    void set_operation_cost(const std::wstring &in, 
                            const std::wstring &out, 
                            int cost);
  };
```

The constructor of the module requests one parameter stating the file to load, second optional parameter stating whether the automata must recognize just the words in the given dictionary file, or it must recognize compounds of these words (that is, the language _L_(_L_ +)). The third parameter -also optional- is a file with the cost matrix for SED operations. If the cost matrix is not given, all operations default to a cost of 1 (or to the value set with the method `set_basic_operation_cost`).

The automata file may have extension `.src` or `.bin`. If the extension is `.src`, the file is intepreted as a text file with one word per line. The FSM is built to recognize the vocabulary contained in the file.

If the extension is `.bin`, the file is intepreted as a binary <tt>libfoma</tt> FSM. To compile such a binary file, FOMA command line front-end must be used. The front-end is not included in FreeLing. You will need to install FOMA if you want to create binary FSM files. See <small class="SMALL"><tt>[http://code.google.com/p/foma](http://code.google.com/p/foma)</tt></small> for details.

A cost matrix for SED operations may be specified only for text FSMs (i.e., for `.src` files). To use a cost matrix with a `.bin` file, you can compile it into the automata using FOMA front-end.

The format of the cost matrix must comply with FOMA formats. See FOMA documentation, or examples provided in `data/common/alternatives` in FreeLing tarball.

The method `get_similar_words` will receive a string and return a list of entries in the FSM vocabulary sorted by string edit distance to the input string.

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

# Input/Output handling modules {#input-output-handling-modules}

FreeLing package includes a few classes that can convert between FreeLing analyzed documents and an output representantion. New classes can be created by the user to meet specific needs.

The I/O handlers are derived from two top abstract classes: <tt>input_handler</tt> and <tt>output_handler</tt>.

Derived classes handle a particular I/O format, and must implement the appropriate methods.

```C++
class input_handler {

 public:   
   /// constructor. 
   input_handler ();
   /// destructor
   ~input_handler();

   /// load partially analyzed sentences from 'lines' into a list of sentences
   virtual void input_sentences(const std::wstring &lines, 
                                std::list<freeling::sentence> &ls) const = 0;
   /// load partially analyzed sentences from 'lines' into a document
   virtual void input_document(const std::wstring &lines, 
                               freeling::document &doc) const;
};
```

```C++
class output_handler {

 public:   
   /// empty constructor
   output_handler();
   /// destructor
   ~output_handler();

   /// load tagset rules for PoS shortening and MSD descriptions
   void load_tagset(const std::wstring &ftag);
   /// set language 
   void set_language(const std::wstring &lg);

   /// Print appropriate header for the output 
   /// format (e.g. XML header or tag opening)
   virtual void PrintHeader(std::wostream &sout) const;
   /// print appropriate footer (e.g. close XML tags)
   virtual void PrintFooter(std::wostream &sout) const; 
   /// print given sentences to sout in appropriate format (no headers)
   virtual void PrintResults(std::wostream &sout,
                             const std::list<freeling::sentence> &ls) const=0;
   virtual std::wstring PrintResults(const std::list<freeling::sentence> &ls) const;

   /// print given document to sout in appropriate format, including headers.
   virtual void PrintResults(std::wostream &sout, 
                             const freeling::document &doc) const = 0;
   virtual std::wstring PrintResults (const freeling::document &doc) const;
};
```

## Output handlers {#output-handlers}

Currently, the following output handlers are implemented. All of them are derived from <tt>output_handler</tt>.

The module <tt>output_freeling</tt> produces the classical FreeLing output (column-like for lower analysis levels, and parenthesized trees for higher levels). The desired output can be configured by the calling application activating or deactivating print levels.

```C++
class output_freeling : public output_handler {
 public:   
   // constructor. 
   output_freeling ();
   output_freeling(const std::wstring &cfgFile);
   ~output_freeling ();

   /// output a parse tree
   void PrintTree (std::wostream &sout, 
                   freeling::parse_tree::const_iterator n, 
                   int depth) const;
   /// output a dependency tree
   void PrintDepTree (std::wostream &sout, 
                      freeling::dep_tree::const_iterator n, 
                      int depth) const;
   /// output a predicate structure 
   void PrintPredArgs (std::wostream &sout, 
                       const freeling::sentence &s) const;
   /// output a word and its morphological information
   void PrintWord (std::wostream &sout, 
                   const freeling::word &w, 
                   bool only_sel=true, 
                   bool probs=true) const;
   /// Output coreference groups
   void PrintCorefs(std::wostream &sout, 
                    const freeling::document &doc) const;
   /// Output semantic Graph
   void PrintSemgraph(std::wostream &sout, 
                      const freeling::document &doc) const;

   /// print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   /// print given document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;

   /// inherit other methods from abstract class
   using output_handler::PrintResults;

   // activate/deactivate printing levels
   void output_senses(bool);
   void output_all_senses(bool);
   void output_phonetics(bool);
   void output_dep_tree(bool);
   void output_corefs(bool);  
   void output_semgraph(bool);
};
```

The module <tt>output_conll</tt> produces a CoNLL-like column format. The default format is not exactly any of the CoNLL competitions, but an adapted version.

The module will always print all information avaliable in the document (i.e. if the document is parsed, a column for the parse tree will be generated).

The constructor may be called with a configuration file stating which columns should be printed and in which order.

```C++
class output_conll : public output_handler {

 public:   
   /// empty constructor. 
   output_conll ();
   /// constructor from cfg file
   output_conll (const std::wstring &cfgFile);
   /// destructor. 
   ~output_conll ();

   /// Fill conll_sentence from freeling::sentence
   void freeling2conll(const freeling::sentence &s, 
                       conll_sentence &cs) const;

   /// print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   /// print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;
};
```

The module <tt>output_xml</tt> produces an XML representation of the analyzed document.

The module will always print all information avaliable in the document (i.e. if the document is parsed, an XML tag for the parse tree will be generated).

```C++
class output_xml : public output_handler {

 public:   
   /// constructor. 
   output_xml ();
   output_xml (const std::wstring &cfgFile);
   /// destructor. 
   ~output_xml ();

   /// print XML file header
   void PrintHeader(std::wostream &sout) const; 
   /// print XML file footer
   void PrintFooter(std::wostream &sout) const; 

   /// print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   /// print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;
};
```

The module <tt>output_json</tt> produces a JSON object for the analyzed document.

The module will always print all information avaliable in the document (i.e. if the document is parsed, an JSON object for the parse tree will be included in the document object).

```C++
class output_json : public output_handler {

 public:   
   // constructor. 
   output_json ();
   output_json (const std::wstring &cfgFile);
   // destructor. 
   ~output_json ();

   // print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   // print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;
};
```

The module <tt>output_naf</tt> produces a NAF [FSB<sup>+</sup>14] representation for the analyzed document.

The desired output can be configured by the calling application activating or deactivating annotation layers.

```C++
class output_naf : public output_handler {
 public:   
   // constructor. 
   output_naf ();
   output_naf (const std::wstring &cfgFile);
   // destructor. 
   ~output_naf ();

   // print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   // print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;

   // print NAF header
   void PrintHeader(std::wostream &sout) const;
   // print NAF footer
   void PrintFooter(std::wostream &sout) const; 

   // activate/deactivate layer for next printings
   void ActivateLayer(const std::wstring &ly, bool b);
};
```

The module <tt>output_train</tt> produces a FreeLing specific format suitable to be used to retrain the PoS tagger (tipically after hand correction of the tagger errors).

```C++
class output_train : public output_handler {

 public:   
   // constructor. 
   output_train ();
   ~output_train ();

   void PrintWord (std::wostream &sout, 
                   const freeling::word &w, 
                   bool only_sel=true, 
                   bool probs=true) const;
   // print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   // print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;
};
```
